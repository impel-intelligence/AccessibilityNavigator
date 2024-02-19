import Foundation
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
    case noElementWithSubrole(subrole: ElementSubrole)
    case outOfRange(index: Int)
}
