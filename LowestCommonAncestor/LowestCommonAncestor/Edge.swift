//
//  Edge.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

import Foundation

public class Edge<T>: CustomStringConvertible {
    var from: Vertex<T>
    var to: Vertex<T>
    init(_ src:Vertex<T>,_ dst:Vertex<T>) {
        from = src
        to = dst
    }
    public var description: String{
        return "(\(from):\(to))"
    }
}
