//
//  Vertex.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips on 24/10/2018.
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable> {
    public let index: Int
    public var data: T
    
}

extension Vertex: CustomStringConvertible { //allow to be printed as a string
    public var description: String {
        return "\(index): \(data)"
    }
}

extension Vertex: Hashable { //conform to hashable protocol
    public var hashValue: Int {
        return "\(data)\(index)".hashValue
    }
}

public func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool { // conform to equatable protocol
    if lhs.index != rhs.index
    {
        return false
    }
    if lhs.data == rhs.data
    {
        return false;
    }
    return true;
}


