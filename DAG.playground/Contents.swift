

public class Vertex<T> : CustomStringConvertible{
    var key: Int
    var data: T
    var neighbours: Array<Edge<T>>
    init(_ key:Int,_ data:T) {
        self.key = key
        self.data = data
        self.neighbours = Array<Edge<T>>()
    }
    public var description: String{
        return "(\(key):\(data))"
    }
}

public class Edge<T>: CustomStringConvertible {
    var from: Vertex<T>
    var to: Vertex<T>
    init(_ src:Vertex<T>,_ dst:Vertex<T>) {
        from = src
        to = dst
    }
    public var description: String{
        return "(\(from):\(to))"
    }
}
//printable queue class
public class Queue<T> : CustomStringConvertible{
    var array = [T]()
    public var description: String{
        var str = ""
        for i in array {
            str+="\(i) "
        }
        return "\(str)"
    }
    public var count: Int {
        return array.count
    }
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public func enqueue(_ element: T) {
        array.append(element)
    }
    public func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
print(queue)
queue.dequeue()
print(queue)
queue.dequeue()
print(queue)
print(queue.count)
