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
    func LCA(n1: Int,n2:Int) -> Node? {
        return findLCA(n:root,n1:n1,n2:n2)
    }
    func findLCA(n:Node?, n1:Int,n2:Int) -> Node? {
        if n ==  nil {
            return nil
        }
        if(n!.val == n1 || n!.val == n2) { return n }
        let left_lca = findLCA(n:n!.left,n1:n1,n2:n2)
        let right_lca = findLCA(n:n!.right,n1:n1,n2:n2)
        if (left_lca != nil && right_lca != nil) { return n }
        return (left_lca != nil) ? left_lca : right_lca
    }
}
