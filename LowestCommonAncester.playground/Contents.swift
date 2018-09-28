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



