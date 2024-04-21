import Cocoa

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
    // The following four functions all return self instead of the value form SetValue because it will almost definitely fail. This is because the values are private and do not report their implementation to Accessibility properly. This means that the call will throw with AXError -25205.
    
    /// Enables an enhanced accessibility mode in Electron applications.
    /// - Returns: An element with AXManualAccessibility set to true
    public func enableManualAccessibility() throws -> Element {
        _ = try? self.setValue(attribute: .AXManualAccessibility, to: .cfBoolean(value: true as CFBoolean))
        return self
    }
    
    /// Enables an enhanced accessibility mode in Electron applications.
    /// - Returns: An element with AXManualAccessibility set to false
    public func disableManualAccessibility() -> Element {
        _ = try? self.setValue(attribute: .AXManualAccessibility, to: .cfBoolean(value: false as CFBoolean))
        return self
    }
    
    /// Enables an enhanced accessibility user interface in some applications. Namely chromium based browser.
    /// May break window managers and electron apps, so use sparingly and disable after use.
    /// - Returns: An element with AXEnhancedUserInterface set to true
    @discardableResult
    public func enableEnhancedUserInterface() -> Element {
        _ = try? self.setValue(attribute: .AXEnhancedUserInterface, to: .cfBoolean(value: true as CFBoolean))
        return self
    }
    
    /// Disables an enhanced accessibility user interface in some applications. Namely chromium based browser.
    /// - Returns: An element with AXEnhancedUserInterface set to false
    @discardableResult
    public func disableEnhancedUserInterface() -> Element {
        _ = try? self.setValue(attribute: .AXEnhancedUserInterface, to: .cfBoolean(value: false as CFBoolean))
        return self
    }
}

extension Element {
    public func children() -> [Element] {
        return element.children?.compactMap({ Element(element: $0) }) ?? []
    }
    
    public func allChilden() -> [Element] {
        var collectedElements: [Element] = children()

        for child in children() {
            let subElements = child.allChilden()
            collectedElements.append(contentsOf: subElements)
        }
                
        return collectedElements
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
    public func setActionTimeout(timeout: Float) -> Element {
        AXUIElementSetMessagingTimeout(element, timeout)
        return self
    }
    
    @discardableResult
    public func click() throws -> Element {
        let error = AXUIElementPerformAction(element, Action.pressAction.value as CFString)
        guard error == .success else { throw ElementError.performActionError(error: error) }
        return self
    }
    
    @discardableResult
    public func confirm() throws -> Element {
        let error = AXUIElementPerformAction(element, Action.confirmationAction.value as CFString)
        guard error == .success else { throw ElementError.performActionError(error: error) }
        return self
    }
    
    @discardableResult
    public func performAction(action: Action) throws -> Element {
        let error = AXUIElementPerformAction(element, action.value as CFString)
        guard error == .success else { throw ElementError.performActionError(error: error) }
        return self
    }
    
    public func setValue(attribute: Attribute, to value: AttributeValue) throws -> Element {
        guard let ref = value.coreFoundationValue() else { throw ElementError.invalidValue }
        let error = AXUIElementSetAttributeValue(element, attribute.attribute as CFString, ref)
        guard error == .success else { throw ElementError.setValueError(error: error) }
        return self
    }
}

