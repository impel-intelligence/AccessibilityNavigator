import Cocoa

extension AXUIElement {
    public var subrole: ElementSubrole? {
        let raw: String? = value(for: kAXSubroleAttribute)
        guard let raw else { return nil }
        return ElementSubrole(rawValue: raw)
    }
}

public enum ElementSubrole: RawRepresentable, CaseIterable {
    public typealias RawValue = String
    
    case closeButton
    case minimizeButton
    case zoomButton
    case toolbarButton
    case fullScreenButton
    case secureTextField
    case tableRow
    case outlineRow
    case unknown
    case standardWindow
    case dialog
    case systemDialog
    case floatingWindow
    case decorative
    case incrementArrow
    case decrementArrow
    case incrementPage
    case decrementPage
    case sortButton
    case searchField
    case timeline
    case ratingIndicator
    case contentList
    case definitionList
    case descriptionList
    case toggle
    case `switch`
    
    case applicationDockItem
    case documentDockItem
    case folderDockItem
    case minimizedWindowDockItem
    case urlDockItem
    case dockExtraDockItem
    case trashDockItem
    case separatorDockItem
    case processSwitcherList
    
    // Browser Roles
    case AXLandmarkBanner
    case AXDocumentArticle
    case AXApplicationGroup
    
    public init?(rawValue: String) {
        switch rawValue {
        case kAXCloseButtonSubrole:
            self = .closeButton
        case kAXMinimizeButtonSubrole:
            self = .minimizeButton
        case kAXZoomButtonSubrole:
            self = .zoomButton
        case kAXToolbarButtonSubrole:
            self = .toolbarButton
        case kAXFullScreenButtonSubrole:
            self = .fullScreenButton
        case kAXSecureTextFieldSubrole:
            self = .secureTextField
        case kAXTableRowSubrole:
            self = .tableRow
        case kAXOutlineRowSubrole:
            self = .outlineRow
        case kAXUnknownSubrole:
            self = .unknown
        case kAXStandardWindowSubrole:
            self = .standardWindow
        case kAXDialogSubrole:
            self = .dialog
        case kAXSystemDialogSubrole:
            self = .systemDialog
        case kAXFloatingWindowSubrole:
            self = .floatingWindow
        case kAXDecorativeSubrole:
            self = .decorative
        case kAXIncrementArrowSubrole:
            self = .incrementArrow
        case kAXDecrementArrowSubrole:
            self = .decrementArrow
        case kAXIncrementPageSubrole:
            self = .incrementPage
        case kAXDecrementPageSubrole:
            self = .decrementPage
        case kAXSortButtonSubrole:
            self = .sortButton
        case kAXSearchFieldSubrole:
            self = .searchField
        case kAXTimelineSubrole:
            self = .timeline
        case kAXRatingIndicatorSubrole:
            self = .ratingIndicator
        case kAXContentListSubrole:
            self = .contentList
        case kAXDefinitionListSubrole:
            self = .definitionList
        case kAXDescriptionListSubrole:
            self = .descriptionList
        case kAXToggleSubrole:
            self = .toggle
        case kAXSwitchSubrole:
            self = .switch
        case kAXApplicationDockItemSubrole:
            self = .applicationDockItem
        case kAXDocumentDockItemSubrole:
            self = .documentDockItem
        case kAXFolderDockItemSubrole:
            self = .folderDockItem
        case kAXMinimizedWindowDockItemSubrole:
            self = .minimizedWindowDockItem
        case kAXURLDockItemSubrole:
            self = .urlDockItem
        case kAXDockExtraDockItemSubrole:
            self = .dockExtraDockItem
        case kAXTrashDockItemSubrole:
            self = .trashDockItem
        case kAXSeparatorDockItemSubrole:
            self = .separatorDockItem
        case kAXProcessSwitcherListSubrole:
            self = .processSwitcherList
        default:
            self = .unknown
        }
    }
    
    public var rawValue: String {
        switch self {
        case .closeButton:
            return kAXCloseButtonSubrole
        case .minimizeButton:
            return kAXMinimizeButtonSubrole
        case .zoomButton:
            return kAXZoomButtonSubrole
        case .toolbarButton:
            return kAXToolbarButtonSubrole
        case .fullScreenButton:
            return kAXFullScreenButtonSubrole
        case .secureTextField:
            return kAXSecureTextFieldSubrole
        case .tableRow:
            return kAXTableRowSubrole
        case .outlineRow:
            return kAXOutlineRowSubrole
        case .unknown:
            return kAXUnknownSubrole
        case .standardWindow:
            return kAXStandardWindowSubrole
        case .dialog:
            return kAXDialogSubrole
        case .systemDialog:
            return kAXSystemDialogSubrole
        case .floatingWindow:
            return kAXFloatingWindowSubrole
        case .decorative:
            return kAXDecorativeSubrole
        case .incrementArrow:
            return kAXIncrementArrowSubrole
        case .decrementArrow:
            return kAXDecrementArrowSubrole
        case .incrementPage:
            return kAXIncrementPageSubrole
        case .decrementPage:
            return kAXDecrementPageSubrole
        case .sortButton:
            return kAXSortButtonSubrole
        case .searchField:
            return kAXSearchFieldSubrole
        case .timeline:
            return kAXTimelineSubrole
        case .ratingIndicator:
            return kAXRatingIndicatorSubrole
        case .contentList:
            return kAXContentListSubrole
        case .definitionList:
            return kAXDefinitionListSubrole
        case .descriptionList:
            return kAXDescriptionListSubrole
        case .toggle:
            return kAXToggleSubrole
        case .switch:
            return kAXSwitchSubrole
        case .applicationDockItem:
            return kAXApplicationDockItemSubrole
        case .documentDockItem:
            return kAXDocumentDockItemSubrole
        case .folderDockItem:
            return kAXFolderDockItemSubrole
        case .minimizedWindowDockItem:
            return kAXMinimizedWindowDockItemSubrole
        case .urlDockItem:
            return kAXURLDockItemSubrole
        case .dockExtraDockItem:
            return kAXDockExtraDockItemSubrole
        case .trashDockItem:
            return kAXTrashDockItemSubrole
        case .separatorDockItem:
            return kAXSeparatorDockItemSubrole
        case .processSwitcherList:
            return kAXProcessSwitcherListSubrole
        case .AXLandmarkBanner:
            return kAXLandmarkBannerSubrole
        case .AXDocumentArticle:
            return kAXDocumentArticleSubrole
        case .AXApplicationGroup:
            return kAXApplicationGroupSubrole
        }
    }
}
