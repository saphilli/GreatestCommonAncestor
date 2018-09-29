//
//  BinaryTree.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips on 29/09/2018.
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//
class Node <T> {
    var value: T
    var left: Node?
    var right: Node? //can be nodes or null values
    init(left:Node?,value: T,right:Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
class BinaryTree<T>{
    var root: Node<Any>?
    init(root: Node<Any>?,count:Int) {
        self.root = root
    }
    
    func countNodes(n:Node<Any>?) -> Int {
        var count : Int
        if (n == nil) {
            return 0
        }
        
        count = 1 + countNodes(n: n?.left) + countNodes(n:n?.right)
        return (count)
        
    }
//    func BinaryTree: CustomStringConvertible {
//        public var description: String {
//            switch self {
//            case let .node(left, value, right):
//                return "value: \(value), left = (" + left.description + "), right = (" + right.description + ")"
//            case .empty:
//                return ""
//            }
//        }
//}


}
