import Cocoa

public class AccessibilityNavigator {
    static public func application(pid: pid_t) -> Element {
        let element = AXUIElementCreateApplication(pid)
        return Element(element: element)
    }
    
    static public func system() -> Element {
        let element = AXUIElementCreateSystemWide()
        return Element(element: element)
    }
}
