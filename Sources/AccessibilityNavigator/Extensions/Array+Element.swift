//
//  File.swift
//  
//
//  Created by Taylor Lineman on 17/2/24.
//

import Foundation

// MARK: Find Where Value
extension [Element] {
    public func findWhere(attribute: Attribute, is value: AttributeValue) throws -> [Element] {
        var matching: [Element] = []
        
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue == value {
                matching.append(element)
            }
        }
        
        return matching
    }
    
    public func findFirstWhere(attribute: Attribute, is value: AttributeValue) throws -> Element {
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue == value {
                return element
            }
        }
        
        throw FindError.noElementWithValue(value: value, attribute: attribute)
    }
    
    public func findLastWhere(attribute: Attribute, is value: AttributeValue) throws -> Element {
        for element in self.reversed() {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue == value {
                return element
            }
        }

        throw FindError.noElementWithValue(value: value, attribute: attribute)
    }
}

// MARK: Find Where NOT Value
extension [Element] {
    public func findWhereNot(attribute: Attribute, is value: AttributeValue) throws -> [Element] {
        var matching: [Element] = []
        
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue != value {
                matching.append(element)
            }
        }
        
        return matching
    }
    
    public func findFirstWhereNot(attribute: Attribute, is value: AttributeValue) throws -> Element {
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue != value {
                return element
            }
        }
        
        throw FindError.noElementWithValue(value: value, attribute: attribute)
    }
    
    public func findLastWhereNot(attribute: Attribute, is value: AttributeValue) throws -> Element {
        for element in self.reversed() {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue != value {
                return element
            }
        }

        throw FindError.noElementWithValue(value: value, attribute: attribute)
    }
}

// MARK: Find Where Contains
extension [Element] {
    public func findWhere(attribute: Attribute, contains value: String) throws -> [Element] {
        var matching: [Element] = []
        
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue.contains(string: value) {
                matching.append(element)
            }
        }
        
        return matching
    }
    
    public func findFirstWhere(attribute: Attribute, contains value: String) throws -> Element {
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue.contains(string: value) {
                return element
            }
        }
        
        throw FindError.noElementContains(string: value, attribute: attribute)
    }

    public func findLastWhere(attribute: Attribute, contains value: String) throws -> Element {
        for element in self.reversed() {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if elementValue.contains(string: value) {
                return element
            }
        }

        throw FindError.noElementContains(string: value, attribute: attribute)
    }
}

// MARK: Find Where NOT Contains
extension [Element] {
    public func findWhereNot(attribute: Attribute, contains value: String) throws -> [Element] {
        var matching: [Element] = []
        
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if !elementValue.contains(string: value) {
                matching.append(element)
            }
        }
        
        return matching
    }
    
    public func findFirstWhereNot(attribute: Attribute, contains value: String) throws -> Element {
        for element in self {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if !elementValue.contains(string: value) {
                return element
            }
        }
        
        throw FindError.noElementContains(string: value, attribute: attribute)
    }

    public func findLastWhereNot(attribute: Attribute, contains value: String) throws -> Element {
        for element in self.reversed() {
            guard let elementValue = try? element.value(for: attribute) else { continue }

            if !elementValue.contains(string: value) {
                return element
            }
        }

        throw FindError.noElementContains(string: value, attribute: attribute)
    }
}


// MARK: Find Role
extension [Element] {
    public func findRole(role: ElementRole) -> [Element] {
        return self.filter({$0.element.role == role})
    }

    public func findFirstRole(role: ElementRole) throws -> Element {
        guard let element = self.first(where: {$0.element.role == role}) else {
            throw FindError.noElementWithRole(role: role)
        }
        
        return element
    }

    public func findLastRole(role: ElementRole) throws -> Element {
        guard let element = self.last(where: {$0.element.role == role}) else {
            throw FindError.noElementWithRole(role: role)
        }
        
        return element
    }
}

// MARK: Index
extension [Element] {
    public func itemAt(_ index: Int) throws -> Element {
        guard index >= 0 && index < self.count else { throw FindError.outOfRange(index: index) }
        return self[index]
    }
}
