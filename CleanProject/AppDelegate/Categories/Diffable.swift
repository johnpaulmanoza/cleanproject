//
//  Diffable.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import IGListKit

extension Sequence where Iterator.Element: Diffable {
    public func diffable() -> [ListDiffable] {
        let toListDiffable: [ListDiffable] = map{ DiffableBox(value: $0, identifier: $0.diffIdentifier as NSObjectProtocol, equal: ==) }
        return toListDiffable
    }
}

/**
 A diffable value type that can be used in conjunction with
 `DiffUtility` to perform a diff between two result sets.
 */
public protocol Diffable: Equatable {
    
    /**
     Returns a key that uniquely identifies the object.
     
     - returns: A key that can be used to uniquely identify the object.
     
     - note: Two objects may share the same identifier, but are not equal.
     
     - warning: This value should never be mutated.
     */
    var diffIdentifier: String { get }
}

extension String: Diffable {
    public var diffIdentifier: String { return self }
}

extension Int: Diffable {
    public var diffIdentifier: String { return String(self) }
}

public final class DiffableBox<T: Diffable>: ListDiffable {
    
    public let value: T
    let identifier: NSObjectProtocol
    let equal: (T, T) -> Bool
    
    init(value: T, identifier: NSObjectProtocol, equal: @escaping(T, T) -> Bool) {
        self.value = value
        self.identifier = identifier
        self.equal = equal
    }
    
    public func generic<T>(parameter: AnyObject, type: T.Type) -> Bool {
        if parameter is T {
            return true
        } else {
            return false
        }
    }
    
    // ListDiffable
    
    public func diffIdentifier() -> NSObjectProtocol {
        return identifier
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let other = object as? DiffableBox<T> {
            return equal(value, other.value)
        }
        return false
    }
    
}
