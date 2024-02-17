import Cocoa

public enum ElementError: Error {
    case unknownType
    case axValueInvalid
    case axValueNil
    case copyAttributeError(error: AXError)
    case performActionError(error: AXError)
}

public enum FindError: Error  {
    case noElementWithValue(value: AttributeValue, attribute: Attribute)
    case noElementContains(string: String, attribute: Attribute)
    case noElementWithRole(role: ElementRole)
    case outOfRange(index: Int)
}

public class Element {
    var element: AXUIElement
    
    init(element: AXUIElement) {
        self.element = element
    }
    
    public func info() -> String {
        var infoString = ""
        
        for item in Attribute.allCases {
            let value = try? self.value(for: item)
            infoString += "\(item.attribute) = \(value?.stringValue ?? "nil") (\(value?.typeStringValue ?? ""))\n"
        }
        
        return infoString
    }
}

extension Element {
    public func children() -> [Element] {
        return element.children?.compactMap({ Element(element: $0) }) ?? []
    }

    public func value(for attribute: Attribute) throws -> AttributeValue {
        var ptr: CFTypeRef?
        let error = AXUIElementCopyAttributeValue(element, attribute.attribute as CFString, &ptr)
        guard error == .success else { throw ElementError.copyAttributeError(error: error) }
        let type = CFGetTypeID(ptr)
        let name = (CFCopyTypeIDDescription(type) ?? "" as CFString) as String
        
        switch name {
        case "AXUIElement": // AXUIElement
            return .axIUElement(value: ptr as! AXUIElement)
        case "AXValue": // AXValue
            return try processAXValue(value: ptr as! AXValue)
        case "CFArray": // CFArray
            return .cfArray(value: ptr as! CFArray)
        case "CFBoolean": // CFBoolean
            return .cfBoolean(value: ptr as! CFBoolean)
        case "CFNumber": // CFNumber
            return .cfNumber(value:  ptr as! CFNumber)
        case "CFString": // CFString
            return .cfString(value: ptr as! CFString)
        case "CFURL": // CFURL
            return .cfURL(value: ptr as! CFURL)
        case "CFAttributedString":
            return .cfAttributedString(value: ptr as! CFAttributedString)
        default:
            throw ElementError.unknownType
        }
    }
    
    private func processAXValue(value: AXValue) throws -> AttributeValue {
        let typeID = AXValueGetType(value) as AXValueType

        switch typeID {
        case .cgPoint:
            var ptr: CGPoint?
            guard AXValueGetValue(value, typeID, &ptr) else { throw ElementError.axValueInvalid }
            guard ptr != nil else { throw ElementError.axValueNil }
            
            return .cgPoint(value: ptr!)
        case .cgSize:
            var ptr: CGSize?
            guard AXValueGetValue(value, typeID, &ptr) else { throw ElementError.axValueInvalid }
            guard ptr != nil else { throw ElementError.axValueNil }

            return .cgSize(value: ptr!)
        case .cgRect:
            var ptr: CGRect?
            guard AXValueGetValue(value, typeID, &ptr) else { throw ElementError.axValueInvalid }
            guard ptr != nil else { throw ElementError.axValueNil }

            return .cgRect(value: ptr!)
        case .cfRange:
            var ptr: CFRange?
            guard AXValueGetValue(value, typeID, &ptr) else { throw ElementError.axValueInvalid }
            guard ptr != nil else { throw ElementError.axValueNil }

            return .cfRange(value: ptr!)
        case .axError:
            var ptr: AXError?
            guard AXValueGetValue(value, typeID, &ptr) else { throw ElementError.axValueInvalid }
            guard ptr != nil else { throw ElementError.axValueNil }

            return .axError(value: ptr!)
        case .illegal:
            return .illegal
        @unknown default:
            return .illegal
        }
    }
}

extension Element {
    func setActionTimeout(timeout: Float) -> Element {
        AXUIElementSetMessagingTimeout(element, timeout)
        return self
    }
    
    @discardableResult
    func click() throws -> Element {
        let error = AXUIElementPerformAction(element, Action.pressAction.value as CFString)
        guard error == .success else { throw ElementError.performActionError(error: error) }
        return self
    }
    
    @discardableResult
    func performAction(action: Action) throws -> Element {
        let error = AXUIElementPerformAction(element, action.value as CFString)
        guard error == .success else { throw ElementError.performActionError(error: error) }
        return self
    }
}

extension [Element] {
    public func itemAt(_ index: Int) throws -> Element {
        guard index > 0 && index < self.count else { throw FindError.outOfRange(index: index) }
        return self[index]
    }
    
    public func findWhere(attribute: Attribute, is value: AttributeValue) throws -> [Element] {
        var matching: [Element] = []
        
        for element in self {
            if try element.value(for: attribute) == value {
                matching.append(element)
            }
        }
        
        return matching
    }
    
    public func findFirstWhere(attribute: Attribute, is value: AttributeValue) throws -> Element {
        for element in self {
            if try element.value(for: attribute) == value {
                return element
            }
        }
        
        throw FindError.noElementWithValue(value: value, attribute: attribute)
    }

    public func findLastWhere(attribute: Attribute, is value: AttributeValue) throws -> Element {
        for element in self {
            if try element.value(for: attribute) == value {
                return element
            }
        }

        throw FindError.noElementWithValue(value: value, attribute: attribute)
    }
    
    public func findWhere(attribute: Attribute, contains value: String) throws -> [Element] {
        var matching: [Element] = []
        
        for element in self {
            if try element.value(for: attribute).contains(string: value) {
                matching.append(element)
            }
        }
        
        return matching
    }
    
    public func findFirstWhere(attribute: Attribute, contains value: String) throws -> Element {
        for element in self {
            if try element.value(for: attribute).contains(string: value) {
                return element
            }
        }
        
        throw FindError.noElementContains(string: value, attribute: attribute)
    }

    public func findLastWhere(attribute: Attribute, contains value: String) throws -> Element {
        for element in self.reversed() {
            if try element.value(for: attribute).contains(string: value) {
                return element
            }
        }

        throw FindError.noElementContains(string: value, attribute: attribute)
    }

    public func findRole(role: ElementRole) -> [Element] {
        return self.filter({$0.element.role == role})
    }

    public func findFirstRole(role: ElementRole) throws -> Element {
        guard let element = self.first(where: {$0.element.role == role}) else {
            throw FindError.noElementWithRole(role: role)
        }
        
        return element
    }

    public func findLastRole(role: ElementRole) throws -> Element {
        guard let element = self.last(where: {$0.element.role == role}) else {
            throw FindError.noElementWithRole(role: role)
        }
        
        return element
    }
}

class AccessibilityNavigator: Element {
    static public func application(pid: pid_t) -> Element {
        let element = AXUIElementCreateApplication(pid)
        return Element(element: element)
    }
}
