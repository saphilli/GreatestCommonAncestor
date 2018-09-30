//
//  LowestCommonAncestorTests.swift
//  LowestCommonAncestorTests
//
//  Created by Sarah Phillips on 29/09/2018.
//  Copyright © 2018 Sarah Phillips. All rights reserved.
//

import XCTest
@testable import LowestCommonAncestor

class LowestCommonAncestorTests: XCTestCase {

    func testTreeStructure() {
        let node6 = Node(left:nil,val: 6, right: nil)
        let node3 = Node(left:nil,val: 3, right: nil)
        let node9 = Node(left:nil,val:9,right:nil)
        let node4 = Node(left:nil,val: 4, right: node6)
        let node8 = Node(left:node3,val: 8, right: nil)
        let node2 = Node(left:node4,val: 2, right: node9)
        let node5 = Node (left: node2,val: 5,right: node8)
        let tree = BinaryTree (root: node5)
        XCTAssertEqual(tree.countNodes(n : tree.root),7)
        let tree1 = BinaryTree(root: nil)
        XCTAssertEqual(tree.countNodes(n : tree1.root),0) 
    }
    func testPrint() {
        let node6 = Node(left:nil,val: 6, right: nil)
        let node3 = Node(left:nil,val: 3, right: nil)
        let node9 = Node(left:nil,val:9,right:nil)
        let node4 = Node(left:nil,val: 4, right: node6)
        let node8 = Node(left:node3,val: 8, right: nil)
        let node2 = Node(left:node4,val: 2, right: node9)
        let node5 = Node (left: node2,val: 5,right: node8)
        let tree = BinaryTree (root: node5)
        print(tree.toString(n: tree.root))
    }
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
        XCTAssertEqual(tree.LCA(n1:666,n2:420)?.val,nil)
    }
    func testLCANil() {
        let tree = BinaryTree( root: nil)
        XCTAssertEqual(tree.LCA(n1:2,n2:1)?.val,nil)
        
    }
}
