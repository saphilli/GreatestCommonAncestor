//
//  BinaryTree.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips on 29/09/2018.
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

class Node {
    var val: Int
    var left: Node?
    var right: Node? //can be nodes or nil values
    init(left:Node?,val: Int,right:Node?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class BinaryTree{
    var root: Node?
    init(root: Node?) {
        self.root = root
    }
    
    func countNodes(n:Node?) -> Int {
        var count : Int
        if (n == nil) { return 0 }
        count = 1 + countNodes(n: n?.left) + countNodes(n:n?.right)
        return (count)
        
    }
    func toString(n: Node?) -> String {
        var tree : String
        if (n == nil) { return "_" }
        tree = "value: \(String(describing: (n?.val != nil) ? n!.val : nil ))), left = (\(toString(n: n?.left != nil ? n!.left : nil))), right = (\(toString(n: n?.right != nil ? n!.right : nil)))"
        return tree
    }
}
