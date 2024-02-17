import Cocoa

extension AXUIElement {
    public var role: ElementRole? {
        let raw: String? = value(for: kAXRoleAttribute)
        guard let raw else { return nil }
        return ElementRole(rawValue: raw)
    }
}

public enum ElementRole: String {
    case browser = "AXBrowser"
    case scrollArea = "AXScrollArea"
    case scrollBar = "AXScrollBar"
    case radioGroup = "AXRadioGroup"
    case lis = "AXList"
    case group = "AXGroup"
    case valueIndicator = "AXValueIndicator"
    case comboBox = "AXComboBox"
    case slider = "AXSlider"
    case incrementor = "AXIncrementor"
    case busyIndicator = "AXBusyIndicator"
    case progressIndicator = "AXProgressIndicator"
    case relevanceIndicator = "AXRelevanceIndicator"
    case toolbar = "AXToolbar"
    case disclosureTriangle = "AXDisclosureTriangle"
    case textField = "AXTextField"
    case textArea = "AXTextArea"
    case staticText = "AXStaticText"
    case heading = "AXHeading"
    case menuBar = "AXMenuBar"
    case menuBarItem = "AXMenuBarItem"
    case menu = "AXMenu"
    case menuItem = "AXMenuItem"
    case splitGroup = "AXSplitGroup"
    case splitter = "AXSplitter"
    case colorWell = "AXColorWell"
    case timeField = "AXTimeField"
    case dateField = "AXDateField"
    case helpTag = "AXHelpTag"
    case matte = "AXMatte"
    case dockItem = "AXDockItem"
    case ruler = "AXRuler"
    case rulerMarker = "AXRulerMarker"
    case grid = "AXGrid"
    case levelIndicator = "AXLevelIndicator"
    case cell = "AXCell"
    case layoutArea = "AXLayoutArea"
    case layoutItem = "AXLayoutItem"
    case handle = "AXHandle"
    case popover = "AXPopover"
    case application = "AXApplication"
    case systemWide = "AXSystemWide"
    case window = "AXWindow"
    case sheet = "AXSheet"
    case drawer = "AXDrawer"
    case growArea = "AXGrowArea"
    case image = "AXImage"
    case unknown = "AXUnknown"
    case button = "AXButton"
    case radioButton = "AXRadioButton"
    case checkBox = "AXCheckBox"
    case popUpButton = "AXPopUpButton"
    case menuButton = "AXMenuButton"
    case tabGroup = "AXTabGroup"
    case table = "AXTable"
    case column = "AXColumn"
    case row = "AXRow"
    case outline = "AXOutline"
}
