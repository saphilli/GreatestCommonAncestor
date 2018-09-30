//
//  BinaryTree.swift
//  LowestCommonAncestor
//
//  Created by Sarah Phillips on 29/09/2018.
//  Student Number:16318649
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//
// Node class which the Binary Tree class will consist of
class Node {
    var val: Int //the data the node contains
    var left: Node?
    var right: Node? //can be a node or nil value
    init(left:Node?,val: Int,right:Node?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
//Binary Tree class conisting of nodes
class BinaryTree{
    var root: Node? //highest node of the tree
    init(root: Node?) {
        self.root = root
    }
    //function to count the number of nodes in the binary tree rooted at Node n
    //takes in an Optional Node n and returns an Int
    func countNodes(n:Node?) -> Int {
        var count : Int
        if (n == nil) { return 0 }
        count = 1 + countNodes(n: n?.left) + countNodes(n:n?.right)
        return (count)
        
    }
    //converts the binary tree rooted at Node N into a string to display contents of each node
    //takes in an Optional Node n and returns a String
    func toString(n: Node?) -> String {
        var tree : String
        if (n == nil) { return "_" }
        tree = "value: \(n!.val), left = (\(toString(n: n!.left ))), right = (\(toString(n: n?.right)))"
        return tree
    }
    //recursive function to find the lowest common ancestor of nodes n1 and n2 which are nodes of a binary tree
    //takes in Nodes n1, n2 and returns an Optional Node
    func LCA(n1: Int,n2:Int) -> Node? {
        return findLCA(n:root,n1:n1,n2:n2)
    }
    
    func findLCA(n:Node?, n1:Int,n2:Int) -> Node? {
        if n ==  nil { return nil }
        if(n!.val == n1 || n!.val == n2) { return n } 
        let left_lca = findLCA(n:n!.left,n1:n1,n2:n2)
        let right_lca = findLCA(n:n!.right,n1:n1,n2:n2)
        if (left_lca != nil && right_lca != nil) { return n }
        return (left_lca != nil) ? left_lca : right_lca
    }
}
