import XCTest
@testable import AccessibilityNavigator

final class AccessibilityNavigatorTests: XCTestCase {
//    func testOpenXcodeSettings() throws {
//        let observer = AppObserver()
//        let pid = observer.find(bundleID: "com.apple.dt.Xcode")!
//        
//        // Click the settings button in setting's menu item
//        try AccessibilityNavigator
//            .application(pid: pid)
//            .children()
//            .findFirstRole(role: .menuBar)
//            .children()
//            .findFirstWhere(attribute: .TitleAttribute, is: .cfString(value: "Xcode" as CFString))
//            .children()
//            .findFirstRole(role: .menu)
//            .children()
//            .findFirstWhere(attribute: .TitleAttribute, contains: "Settings")
//            .click()
//    }
    
    func testOpenMessagesSettings() throws {
        let observer = AppObserver()
        let pid = observer.find(bundleID: "com.apple.MobileSMS")!
        
        // Click the settings button in setting's menu item
        try AccessibilityNavigator
            .application(pid: pid)
            .children()
            .findFirstRole(role: .menuBar)
            .children()
            .itemAt(1)
            .children()
            .findFirstRole(role: .menu)
            .children()
            .itemAt(2)
            .click()
        
       let messages = try AccessibilityNavigator
            .application(pid: pid)
            .children()
            
        messages.forEach { element in
            print("======")
            print(element.info())
            print("======")
        }

    }

}
