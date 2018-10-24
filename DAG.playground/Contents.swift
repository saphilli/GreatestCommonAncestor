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

var v1 = Vertex(index: 0, data: 2.0)
var v2 = Vertex(index: 1, data: 5.6)
var edge = Edge(from: v1, to: v2)
print(edge)