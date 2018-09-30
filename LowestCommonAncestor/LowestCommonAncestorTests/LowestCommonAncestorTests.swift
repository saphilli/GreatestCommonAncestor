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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
        
//        print(tree.toString(n: tree.root))
//        print(tree.LCA(n1:9,n2:8)!.val)
    }

    func testPerformanceExample() {
        let node6 = Node(left:nil,val: 6, right: nil)
        let node3 = Node(left:nil,val: 3, right: nil)
        let node9 = Node(left:nil,val:9,right:nil)
        let node4 = Node(left:nil,val: 4, right: node6)
        let node8 = Node(left:node3,val: 8, right: node9)
        let node2 = Node(left:node4,val: 2, right: nil)
        let node5 = Node (left: node2,val: 5,right: node8)
        let tree = BinaryTree (root: node5)
        self.measure {
            XCTAssertEqual(tree.countNodes(n : tree.root),7)
        }
    }
}
