import Cocoa

public enum AttributeValue: Equatable {
    case axIUElement(value: AXUIElement)
    case axValue(value: AXValue)
    case cfArray(value: CFArray)
    case cfBoolean(value: CFBoolean)
    case cfNumber(value: CFNumber)
    case cfString(value: CFString)
    case cfURL(value: CFURL)
    case cfAttributedString(value: CFAttributedString)
    case cgPoint(value: CGPoint)
    case cgSize(value: CGSize)
    case cgRect(value: CGRect)
    case cfRange(value: CFRange)
    case axError(value: AXError)
    case illegal
    
    public func contains(string: String) -> Bool {
        return self.stringValue.lowercased().contains(string.lowercased())
    }
    
    public var typeStringValue: String {
        switch self {
        case .axIUElement(_):
            return "AXUIElement"
        case .axValue(_):
            return "AXValue"
        case .cfArray(_):
            return "CFArray"
        case .cfBoolean(_):
            return "CFBoolean"
        case .cfNumber(_):
            return "CFNumber"
        case .cfString(_):
            return "CFString"
        case .cfURL(_):
            return "CFURL"
        case .cfAttributedString(_):
            return "CFAttributedString"
        case .cgPoint(_):
            return "CGPoint"
        case .cgSize(_):
            return "CGSize"
        case .cgRect(_):
            return "CGRect"
        case .cfRange(_):
            return "CFRange"
        case .axError(_):
            return "AXError"
        case .illegal:
            return "Illegal"
        }
    }
    
    public var stringValue: String {
        switch self {
        case .axIUElement(let value):
            return String("\(value)")
        case .axValue(let value):
            return String("\(value)")
        case .cfArray(let value):
            return String("\(value)")
        case .cfBoolean(let value):
            return String("\(value)")
        case .cfNumber(let value):
            return String("\(value)")
        case .cfString(let value):
            return String("\(value)")
        case .cfURL(let value):
            return String("\(value)")
        case .cfAttributedString(let value):
            return String("\(value)")
        case .cgPoint(let value):
            return String("\(value)")
        case .cgSize(let value):
            return String("\(value)")
        case .cgRect(let value):
            return String("\(value)")
        case .cfRange(let value):
            return String("\(value)")
        case .axError(let value):
            return String("\(value)")
        case .illegal:
            return "Illegal"
        }
    }
    
    public static func == (lhs: AttributeValue, rhs: AttributeValue) -> Bool {
        switch (lhs, rhs) {
        case (.axIUElement(let lhs), .axIUElement(let rhs)):
            return lhs == rhs
        case (.axValue(let lhs), .axValue(let rhs)):
            return lhs == rhs
        case (.cfArray(let lhs), .cfArray(let rhs)):
            return lhs == rhs
        case (.cfBoolean(let lhs), .cfBoolean(let rhs)):
            return lhs == rhs
        case (.cfNumber(let lhs), .cfNumber(let rhs)):
            return lhs == rhs
        case (.cfString(let lhs), .cfString(let rhs)):
            return lhs == rhs
        case (.cfURL(let lhs), .cfURL(let rhs)):
            return lhs == rhs
        case (.cfAttributedString(let lhs), .cfAttributedString(let rhs)):
            return lhs == rhs
        case (.cgPoint(let lhs), .cgPoint(let rhs)):
            return lhs == rhs
        case (.cgSize(let lhs), .cgSize(let rhs)):
            return lhs == rhs
        case (.cgRect(let lhs), .cgRect(let rhs)):
            return lhs == rhs
        case (.cfRange(let lhs), .cfRange(let rhs)):
            return lhs == rhs
        case (.axError(let lhs), .axError(let rhs)):
            return lhs == rhs
        case (.illegal, .illegal):
            return true
        default:
            return true
        }
    }
}
