import Foundation
import Cocoa

public enum Action: String, CaseIterable {
    case pressAction
    case incrementAction
    case decrementAction
    case confirmationAction
    case cancelAction
    case showAlternateUIAction
    case showDefaultUIAction
    case raiseAction
    case showMenuAction
    case pickAction
    
    var value: String {
        switch self {
        case .pressAction:
            return kAXPressAction
        case .incrementAction:
            return kAXIncrementAction
        case .decrementAction:
            return kAXDecrementAction
        case .confirmationAction:
            return kAXConfirmAction
        case .cancelAction:
            return kAXCancelAction
        case .showAlternateUIAction:
            return kAXShowAlternateUIAction
        case .showDefaultUIAction:
            return kAXShowDefaultUIAction
        case .raiseAction:
            return kAXRaiseAction
        case .showMenuAction:
            return kAXShowMenuAction
        case .pickAction:
            return kAXPickAction
        }
    }
}
