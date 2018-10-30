//
//  Queue.swift
//  
//
//  Created by Sarah Phillips
//

import Foundation
//printable queue class
public class Queue<T> : CustomStringConvertible{
    var array = [T]()
    public var description: String{
        var str = ""
        for i in array {
            str+="\(i) "
        }
        return "\(str)"
    }
    public var count: Int {
        return array.count
    }
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public func enqueue(_ element: T) {
        array.append(element)
    }
    public func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return array.removeFirst()
    }
}
