import Cocoa

extension CFRange: Equatable {
    public static func == (lhs: CFRange, rhs: CFRange) -> Bool {
        return lhs.length == rhs.length && lhs.location == rhs.location
    }
}
