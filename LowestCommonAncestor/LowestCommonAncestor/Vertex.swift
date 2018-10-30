//
//  Vertex.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

import Foundation

public class Vertex<T> : CustomStringConvertible{
    var key: Int
    var data: T
    var neighbours: Array<Edge<T>>
    init(_ key:Int,_ data:T) {
        self.key = key
        self.data = data
        self.neighbours = Array<Edge<T>>()
    }
    public var description: String{
        return "(\(key):\(data))"
    }
}

