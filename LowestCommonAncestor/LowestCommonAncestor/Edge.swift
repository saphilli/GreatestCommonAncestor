//
//  Edge.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips on 24/10/2018.
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

import Foundation
//edge conforms to Hashable protocol which conforms to Equatable protocol
public struct Edge<T:Hashable> {
    public let from: Vertex<T> //vertex the edge starts from
    public let to: Vertex<T> //vertex the edge travels to
}
//make edge type printable
extension Edge: CustomStringConvertible {
    public var description: String {
        return "\(from.description) -> \(to.description)" //if w is nil
    }
}
//conform to hashable protocol by providing hashValue
extension Edge: Hashable {
    public var hashValue: Int {
        let string = "\(from.description)\(to.description)"
        return string.hashValue
    }
}
//provide equatable function to conform to equatable protocol
public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    if lhs.from != rhs.from {
        return false
    }
    if lhs.to != rhs.to {
        return false
    }
    return true
}
