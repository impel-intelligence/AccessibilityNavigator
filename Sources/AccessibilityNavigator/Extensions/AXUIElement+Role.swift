import Cocoa

extension AXUIElement {
    public var role: ElementRole? {
        let raw: String? = value(for: kAXRoleAttribute)
        guard let raw else { return nil }
        return ElementRole(rawValue: raw)
    }
}

public enum ElementRole: String, CaseIterable {
    case browser
    case scrollArea
    case scrollBar
    case radioGroup
    case lis
    case group
    case valueIndicator
    case comboBox
    case slider
    case incrementor
    case busyIndicator
    case progressIndicator
    case relevanceIndicator
    case toolbar
    case disclosureTriangle
    case textField
    case textArea
    case staticText
    case heading
    case menuBar
    case menuBarItem
    case menu
    case menuItem
    case splitGroup
    case splitter
    case colorWell
    case timeField
    case dateField
    case helpTag
    case matte
    case dockItem
    case ruler
    case rulerMarker
    case grid
    case levelIndicator
    case cell
    case layoutArea
    case layoutItem
    case handle
    case popover
    case application
    case systemWide
    case window
    case sheet
    case drawer
    case growArea
    case image
    case unknown
    case button
    case radioButton
    case checkBox
    case popUpButton
    case menuButton
    case tabGroup
    case table
    case column
    case row
    case outline
    
    public init?(rawValue: String) {
        switch rawValue {
        case kAXBrowserRole:
            self = .browser
        case kAXScrollAreaRole:
            self = .scrollArea
        case kAXScrollBarRole:
            self = .scrollBar
        case kAXRadioGroupRole:
            self = .radioGroup
        case kAXListRole:
            self = .lis
        case kAXGroupRole:
            self = .group
        case kAXValueIndicatorRole:
            self = .valueIndicator
        case kAXComboBoxRole:
            self = .comboBox
        case kAXSliderRole:
            self = .slider
        case kAXIncrementorRole:
            self = .incrementor
        case kAXBusyIndicatorRole:
            self = .busyIndicator
        case kAXProgressIndicatorRole:
            self = .progressIndicator
        case kAXRelevanceIndicatorRole:
            self = .relevanceIndicator
        case kAXToolbarRole:
            self = .toolbar
        case kAXDisclosureTriangleRole:
            self = .disclosureTriangle
        case kAXTextFieldRole:
            self = .textField
        case kAXTextAreaRole:
            self = .textArea
        case kAXStaticTextRole:
            self = .staticText
        case kAXHeadingRole:
            self = .heading
        case kAXMenuBarRole:
            self = .menuBar
        case kAXMenuBarItemRole:
            self = .menuBarItem
        case kAXMenuRole:
            self = .menu
        case kAXMenuItemRole:
            self = .menuItem
        case kAXSplitGroupRole:
            self = .splitGroup
        case kAXSplitterRole:
            self = .splitter
        case kAXColorWellRole:
            self = .colorWell
        case kAXTimeFieldRole:
            self = .timeField
        case kAXDateFieldRole:
            self = .dateField
        case kAXHelpTagRole:
            self = .helpTag
        case kAXMatteRole:
            self = .matte
        case kAXDockItemRole:
            self = .dockItem
        case kAXRulerRole:
            self = .ruler
        case kAXRulerMarkerRole:
            self = .rulerMarker
        case kAXGridRole:
            self = .grid
        case kAXLevelIndicatorRole:
            self = .levelIndicator
        case kAXCellRole:
            self = .cell
        case kAXLayoutAreaRole:
            self = .layoutArea
        case kAXLayoutItemRole:
            self = .layoutItem
        case kAXHandleRole:
            self = .handle
        case kAXPopoverRole:
            self = .popover
        case kAXApplicationRole:
            self = .application
        case kAXSystemWideRole:
            self = .systemWide
        case kAXWindowRole:
            self = .window
        case kAXSheetRole:
            self = .sheet
        case kAXDrawerRole:
            self = .drawer
        case kAXGrowAreaRole:
            self = .growArea
        case kAXImageRole:
            self = .image
        case kAXUnknownRole:
            self = .unknown
        case kAXButtonRole:
            self = .button
        case kAXRadioButtonRole:
            self = .radioButton
        case kAXCheckBoxRole:
            self = .checkBox
        case kAXPopUpButtonRole:
            self = .popUpButton
        case kAXMenuButtonRole:
            self = .menuButton
        case kAXTabGroupRole:
            self = .tabGroup
        case kAXTableRole:
            self = .table
        case kAXColumnRole:
            self = .column
        case kAXRowRole:
            self = .row
        case kAXOutlineRole:
            self = .outline
        default:
            self = .unknown
        }
    }
    
    public var rawValue: String {
        switch self {
        case .browser:
            return kAXBrowserRole
        case .scrollArea:
            return kAXScrollAreaRole
        case .scrollBar:
            return kAXScrollBarRole
        case .radioGroup:
            return kAXRadioGroupRole
        case .lis:
            return kAXListRole
        case .group:
            return kAXGroupRole
        case .valueIndicator:
            return kAXValueIndicatorRole
        case .comboBox:
            return kAXComboBoxRole
        case .slider:
            return kAXSliderRole
        case .incrementor:
            return kAXIncrementorRole
        case .busyIndicator:
            return kAXBusyIndicatorRole
        case .progressIndicator:
            return kAXProgressIndicatorRole
        case .relevanceIndicator:
            return kAXRelevanceIndicatorRole
        case .toolbar:
            return kAXToolbarRole
        case .disclosureTriangle:
            return kAXDisclosureTriangleRole
        case .textField:
            return kAXTextFieldRole
        case .textArea:
            return kAXTextAreaRole
        case .staticText:
            return kAXStaticTextRole
        case .heading:
            return kAXHeadingRole
        case .menuBar:
            return kAXMenuBarRole
        case .menuBarItem:
            return kAXMenuBarItemRole
        case .menu:
            return kAXMenuRole
        case .menuItem:
            return kAXMenuItemRole
        case .splitGroup:
            return kAXSplitGroupRole
        case .splitter:
            return kAXSplitterRole
        case .colorWell:
            return kAXColorWellRole
        case .timeField:
            return kAXTimeFieldRole
        case .dateField:
            return kAXDateFieldRole
        case .helpTag:
            return kAXHelpTagRole
        case .matte:
            return kAXMatteRole
        case .dockItem:
            return kAXDockItemRole
        case .ruler:
            return kAXRulerRole
        case .rulerMarker:
            return kAXRulerMarkerRole
        case .grid:
            return kAXGridRole
        case .levelIndicator:
            return kAXLevelIndicatorRole
        case .cell:
            return kAXCellRole
        case .layoutArea:
            return kAXLayoutAreaRole
        case .layoutItem:
            return kAXLayoutItemRole
        case .handle:
            return kAXHandleRole
        case .popover:
            return kAXPopoverRole
        case .application:
            return kAXApplicationRole
        case .systemWide:
            return kAXSystemWideRole
        case .window:
            return kAXWindowRole
        case .sheet:
            return kAXSheetRole
        case .drawer:
            return kAXDrawerRole
        case .growArea:
            return kAXGrowAreaRole
        case .image:
            return kAXImageRole
        case .unknown:
            return kAXUnknownRole
        case .button:
            return kAXButtonRole
        case .radioButton:
            return kAXRadioButtonRole
        case .checkBox:
            return kAXCheckBoxRole
        case .popUpButton:
            return kAXPopUpButtonRole
        case .menuButton:
            return kAXMenuButtonRole
        case .tabGroup:
            return kAXTabGroupRole
        case .table:
            return kAXTableRole
        case .column:
            return kAXColumnRole
        case .row:
            return kAXRowRole
        case .outline:
            return kAXOutlineRole
        }
    }
}
