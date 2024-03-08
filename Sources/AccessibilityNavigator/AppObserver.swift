import Cocoa

public class AppObserver {
    private var runningAppsObservation: NSKeyValueObservation? = nil
    var runningApplications: [NSRunningApplication] = []

    public init() {
        runningAppsObservation = NSWorkspace.shared.observe(\.runningApplications, options: [.initial]) { workspace, change in
            let difference = workspace.runningApplications.difference(from: self.runningApplications)
            
            for change in difference {
                switch change {
                case let .remove(offset, _, _):
                    self.runningApplications.remove(at: offset)
                case let .insert(offset, newElement, _):
                    self.runningApplications.insert(newElement, at: offset)
                }
            }
        }
    }
    
    public func find(bundleID: String) -> pid_t? {
        return runningApplications.first(where: {$0.bundleIdentifier == bundleID})?.processIdentifier
    }
}
