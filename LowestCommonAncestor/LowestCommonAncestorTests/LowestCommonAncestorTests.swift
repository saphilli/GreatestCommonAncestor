//
//  LowestCommonAncestorTests.swift
//  LowestCommonAncestorTests
//
//  Created by Sarah Phillips on 29/09/2018.
//  Student Number:16318649
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

import XCTest
@testable import LowestCommonAncestor

class LowestCommonAncestorTests: XCTestCase {

    //Test the general structure of a binary tree and whether count is correct
    //also tests for nill and negative Int inputs
    func testTreeStructure() {
        let node6 = Node(left:nil,val: 6, right: nil)
        let node3 = Node(left:nil,val: -3, right: nil)
        let node9 = Node(left:nil,val:9,right:nil)
        let node4 = Node(left:nil,val: -4, right: node6)
        let node8 = Node(left:node3,val: 8, right: nil)
        let node2 = Node(left:node4,val: 2, right: node9)
        let node5 = Node (left: node2,val: 5,right: node8)
        let tree = BinaryTree (root: node5)
        XCTAssertEqual(tree.countNodes(n : tree.root),7)
        let tree1 = BinaryTree(root: nil)
        XCTAssertEqual(tree.countNodes(n : tree1.root),0) 
    }
    //test to see whether the structure of the binary tree is correctly represented by toString() method
    //tests for nil tree
    func testToString() {
        let node6 = Node(left:nil,val: 6, right: nil)
        let node3 = Node(left:nil,val: 3, right: nil)
        let node9 = Node(left:nil,val:9,right:nil)
        let node4 = Node(left:nil,val: 4, right: node6)
        let node8 = Node(left:node3,val: 8, right: nil)
        let node2 = Node(left:node4,val: 2, right: node9)
        let node5 = Node (left: node2,val: 5,right: node8)
        let tree = BinaryTree (root: node5)
        XCTAssertEqual(tree.toString(n: tree.root),"value: 5, left = (value: 2, left = (value: 4, left = (_), right = (value: 6, left = (_), right = (_))), right = (value: 9, left = (_), right = (_))), right = (value: 8, left = (value: 3, left = (_), right = (_)), right = (_))")
        XCTAssertEqual(tree.toString(n:node2),"value: 2, left = (value: 4, left = (_), right = (value: 6, left = (_), right = (_))), right = (value: 9, left = (_), right = (_))")
        let tree2 = BinaryTree(root: nil)
        XCTAssertEqual(tree2.toString(n:tree2.root),"_")
    }
    //test for LCA function
    func testLCA() {
        let node6 = Node(left:nil,val: 6, right: nil)
        let node3 = Node(left:nil,val: 3, right: nil)
        let node9 = Node(left:nil,val:9,right:nil)
        let node4 = Node(left:nil,val: 4, right: node6)
        let node8 = Node(left:node3,val: 8, right: nil)
        let node2 = Node(left:node4,val: 2, right: node9)
        let node5 = Node (left: node2,val: 5,right: node8)
        let tree = BinaryTree (root: node5)
        XCTAssertEqual(tree.LCA(n1:2,n2:3)?.val,5)
        XCTAssertEqual(tree.LCA(n1:4,n2:9)?.val,2)
        XCTAssertEqual(tree.LCA(n1:5,n2:5)?.val,5)
        XCTAssertEqual(tree.LCA(n1:4,n2:6)?.val,4)
        XCTAssertEqual(tree.LCA(n1:2,n2:8)?.val,5)
        XCTAssertEqual(tree.LCA(n1:9,n2:6)?.val,2)
        XCTAssertEqual(tree.LCA(n1:5,n2:5)?.val,5)
        XCTAssertEqual(tree.LCA(n1:9,n2:3)?.val,5)
        XCTAssertEqual(tree.LCA(n1:667696,n2:4247860)?.val,nil)
    }
    //tests the nil case of the LCA function
    func testNullCaseLCA() {
        let tree = BinaryTree( root: nil)
        XCTAssertEqual(tree.LCA(n1:2,n2:1)?.val,nil)
    }
}
