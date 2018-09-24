enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree,T,BinaryTree)

}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = (" + left.description + "), right = (" + right.description + ")"
        case .empty:
            return ""
        }
    }
}


