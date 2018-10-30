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
    //DAG tests
    func testDAG(){
        let g = Graph("A")
        g.addVertex("B")
        g.addVertex("C")
        g.addVertex("D")
        g.addVertex("E")
        g.addVertex("F")
        g.addVertex("G")
        g.addVertex("H")
        g.addVertex("I")
        g.addEdge(g.graph[0],g.graph[1])
        g.addEdge(g.graph[0],g.graph[2])
        g.addEdge(g.graph[0],g.graph[3])
        g.addEdge(g.graph[1],g.graph[7])
        g.addEdge(g.graph[2],g.graph[8])
        g.addEdge(g.graph[3],g.graph[7])
        g.addEdge(g.graph[3],g.graph[4])
        g.addEdge(g.graph[3],g.graph[8])
        g.addEdge(g.graph[4],g.graph[5])
        g.addEdge(g.graph[4],g.graph[6])
        g.addEdge(g.graph[5],g.graph[7])
        g.addEdge(g.graph[6],g.graph[8])
        XCTAssertEqual("\(g)","\n(0:A):(1:B)(2:C)(3:D)\n(1:B):(7:H)\n(2:C):(8:I)\n(3:D):(7:H)(4:E)(8:I)\n(4:E):(5:F)(6:G)\n(5:F):(7:H)\n(6:G):(8:I)\n(7:H):\n(8:I):")
        XCTAssertEqual("\(g.graph[0].neighbours)","[((0:A)->(1:B)), ((0:A)->(2:C)), ((0:A)->(3:D))]")
        XCTAssertEqual("\(g.graph[1].neighbours)","[((1:B)->(7:H))]")
        XCTAssertEqual("\(g.graph[2].neighbours)","[((2:C)->(8:I))]")
        XCTAssertEqual("\(g.graph[3].neighbours)","[((3:D)->(7:H)), ((3:D)->(4:E)), ((3:D)->(8:I))]")
        XCTAssertEqual("\(g.graph[4].neighbours)","[((4:E)->(5:F)), ((4:E)->(6:G))]")
        XCTAssertEqual("\(g.graph[5].neighbours)","[((5:F)->(7:H))]")
        XCTAssertEqual("\(g.graph[6].neighbours)","[((6:G)->(8:I))]")
        XCTAssertEqual("\(g.graph[7].neighbours)","[]")
        XCTAssertEqual("\(g.graph[8].neighbours)","[]")
    }
    func testQueue() {
        let q = Queue <Int> ()
        XCTAssertEqual(nil,q.dequeue())
        q.enqueue(1)
        q.enqueue(2)
        q.enqueue(3)
        XCTAssertEqual("1 2 3 ","\(q)")
        XCTAssertEqual(q.count,3)
        XCTAssertEqual(1,q.dequeue()!)
        XCTAssertEqual("2 3 ","\(q)")
        XCTAssertEqual(Optional(2),q.dequeue())
        XCTAssertEqual("3 ","\(q)")
    }
    func testLCADAG() {
        let g = Graph("A")
        XCTAssertEqual("\(g.findLCA(g.graph[0],g.graph[0],g.graph[00]))","(0:A)")
        g.addVertex("B")
        g.addVertex("C")
        g.addVertex("D")
        g.addVertex("E")
        g.addVertex("F")
        g.addVertex("G")
        g.addVertex("H")
        g.addVertex("I")
        g.addEdge(g.graph[0],g.graph[1])
        g.addEdge(g.graph[0],g.graph[2])
        g.addEdge(g.graph[0],g.graph[3])
        g.addEdge(g.graph[1],g.graph[7])
        g.addEdge(g.graph[2],g.graph[8])
        g.addEdge(g.graph[3],g.graph[7])
        g.addEdge(g.graph[3],g.graph[4])
        g.addEdge(g.graph[3],g.graph[8])
        g.addEdge(g.graph[4],g.graph[5])
        g.addEdge(g.graph[4],g.graph[6])
        g.addEdge(g.graph[5],g.graph[7])
        g.addEdge(g.graph[6],g.graph[8])
        XCTAssertEqual("\(g.findLCA(g.graph[0],g.graph[7],g.graph[8]))","(4:E)")
        XCTAssertEqual("\(g.findLCA(g.graph[0],g.graph[1],g.graph[8]))","(0:A)")
        
        
    }


}
