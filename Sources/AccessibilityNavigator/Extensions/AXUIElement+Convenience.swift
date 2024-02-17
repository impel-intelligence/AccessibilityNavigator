import Cocoa

extension AXValue {
    public func convert<T>() -> T {
        let ptr: UnsafeMutablePointer<T> = .allocate(capacity: 1)
        AXValueGetValue(self, AXValueGetType(self), ptr)
        let val = ptr.pointee
        ptr.deallocate()
        return val
    }
}

extension AXUIElement {
    public var title: String? { value(for: kAXTitleAttribute) }
    public var label: String? { value(for: kAXLabelValueAttribute) }
    public var elementValue: String? { value(for: kAXValueAttribute) }
    public var description: String? { value(for: kAXDescription) }
    public var text: String? { value(for: kAXTextAttribute) }
    public var help: String? { value(for: kAXHelpAttribute) }
    public var placeholder: String? { value(for: kAXPlaceholderValueAttribute) }
    public var descriptionAttribute: String? { value(for: kAXDescriptionAttribute) }

    public var children: [AXUIElement]? { value(for: kAXChildrenAttribute) }
    public var windows: [AXUIElement]? { value(for: kAXWindowsAttribute) }
    
    public var position: NSPoint? {
        var ptr: CFTypeRef?
        let error = AXUIElementCopyAttributeValue(self, kAXPositionAttribute as CFString, &ptr)
        guard error == .success else { return nil }
        let value = ptr as! AXValue
        return value.convert()
    }
    
    public var size: NSSize? {
        var ptr: CFTypeRef?
        let error = AXUIElementCopyAttributeValue(self, kAXSizeAttribute as CFString, &ptr)
        guard error == .success else { return nil }
        let value = ptr as! AXValue
        return value.convert()
    }

    public func value<T>(for attribute: String) -> T? {
        var ptr: CFTypeRef?
        let error = AXUIElementCopyAttributeValue(self, attribute as CFString, &ptr)
        guard error == .success else { return nil }
        return ptr as? T
    }
    
    public func set(value: CFTypeRef, for attribute: String) {
        AXUIElementSetAttributeValue(self, attribute as CFString, value)
    }
}

extension String {
    public var nilIfEmpty: String? {
        if self.isEmpty {
            return nil
        }
        
        return self
    }
}
