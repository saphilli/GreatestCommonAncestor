public indirect enum BinaryTree<T> {
    case empty
    case node(BinaryTree<T>,T,BinaryTree<T>)
    public var count: Int {
        switch self {
        case let .node(left,_,right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }

}

extension BinaryTree: CustomStringConvertible {
   public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = (" + left.description + "), right = (" + right.description + ")"
        case .empty:
            return ""
        }
    }
}

func testTreeStructure() {
    let node6 = BinaryTree.node(.empty,"6",.empty)
    let node4 = BinaryTree.node(.empty, "4", .empty)
    let node3 = BinaryTree.node(.empty, "3", node6)
    let node7 = BinaryTree.node(.empty, "7", .empty)
    let node2 = BinaryTree.node(node7, "2", node3)
    let node10 = BinaryTree.node(node4, "10", .empty)
    let root = BinaryTree.node(node2, "5", node10)
    print(root) // 5 is root, 6 is lowest leaf node
    if (root.count == 7) { //check number of nodes
        print("Test Passed")
        } else { print("Test Failed") }
}


testTreeStructure()

}







