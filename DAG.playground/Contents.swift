

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
public class DirectedGraph<T>: CustomStringConvertible {
    var graph:Array<Vertex<T>>
    init(_ v: Vertex<T>) {
        graph = []   //the graph is represented as an array of vertices
        graph.append(v)
    }
    public var description: String {
        var str = ""
        var iterator = graph.makeIterator() //iterate through the vertices and list its neighbours
        while let n = iterator.next() {
            str += "\n\(n):"
            var i = n.neighbours.makeIterator()
            while let edges = i.next() {
                str += "\(edges.to)" //print out all the vertices traveled to by this particular vertex
            }
        }
        return str
    }
    //create a new vertex
    func addVertex(_ data: T) -> Vertex<T> {
        let key = graph.count
        let newVertex: Vertex = Vertex<T>(key,data) //set the key
        graph.append(newVertex) //add the vertex to the vertex array
        return newVertex
    }
    //create new edge
    func addEdge(_ src: Vertex<T>,_ dst: Vertex<T>) {
        let newEdge = Edge<T>(src,dst) //create a new edge
        src.neighbours.append(newEdge) //add to neighbour property of the src vertex
    }
    //returns array containing all possible paths in array form leading to dst from src
    func findPaths(_ src:Vertex<T>,_ dst: Vertex<T>) -> Array<Array<Vertex<T>>>{
        let pathQueue = Queue<Array<Vertex<T>>>()       //paths to be explored
        var correctPaths = Array<Array<Vertex<T>>>()    //array that stores correct paths
        var path = Array<Vertex<T>>()                   //create the array of vertices
        if (src === dst) { return correctPaths }
        path.append(src)                                //start as one path starting with src vertex
        pathQueue.enqueue(path)                         //add the path onto the queue
        while let p = pathQueue.dequeue() {             //while a path exists in the queue to be explored
            let lowestVertex = p[p.count-1]             //get most recently added vertex in the path
            for edge in lowestVertex.neighbours {       //for every edge connected to the vertex
                if edge.to === dst {                    //if the next vertex is equal to the dst vertex
                    correctPaths.append(p)              //add to the array of correct paths
                }
                else if edge.to !== dst {               //if the neighbour is not equal to the dst vertex
                    var split = Array<Vertex<T>>()
                    for i in p {                        //make a copy of the current path ("split" the path))
                        split.append(i)
                    }
                    split.append(edge.to)               //add the neighbour onto the end of the copied path
                    pathQueue.enqueue(split)            //add the new path to the queue
                }
                if lowestVertex.neighbours.count == 0 { //if the lowest vertex has no neighbors exit the loop
                    break;
                }
            }
        }
        return correctPaths
    }
    //removes Duplicates of vertices that occur in the 2d array of paths
    func removeDuplicates(_ pathArray : Array<Array<Vertex<T>>>) -> Array<Vertex<T>>{
        var flattened = pathArray.flatMap { $0 } //flatten the 2d array
        var uniques = [Vertex<T>]()
        uniques.append(flattened[0]) //add first vertex
        for v in flattened { //for every vertice in the graph
            var foundDuplicate = false
            for v1 in uniques { //compare to every vertice in unique array
                if v === v1 {
                    foundDuplicate = true
                }
            }
            if foundDuplicate == false{ //add if the vertex hasnt been added to the array already
                uniques.append(v)
            }
        }
        return uniques
    }
    
    func findLCA(_ v:Vertex<T>,_ v1: Vertex<T>,_ v2: Vertex<T>) -> Vertex<T>?{
        let red = findPaths(v,v1) //2d array of ancestors to v1 (coloured red)
        let blue = findPaths(v,v2) //2d array of ancestors to v2 (coloured blue)
        let redAncestors = removeDuplicates(red)
        let blueAncestors = removeDuplicates(blue)
        var commonAncestors = [Vertex<T>]()
        for v in redAncestors{ //get common ancestors
            for v1 in blueAncestors {
                if v===v1 {
                    commonAncestors.append(v)
                }
            }
        }
        //count the children of every ancestor and return the vertex that doesnt have any children (LCA)
        for v in commonAncestors {
            var countChildren = 0
            for edge in v.neighbours {
                for i in commonAncestors{
                    if edge.to === i {
                        countChildren+=1
                    }
                }
            }
            if countChildren == 0 {
                return v
            }
        }
        return nil
    }
    
}

var v = Vertex(0,"A")
var g = DirectedGraph(v)
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
print(g.findLCA(g.graph[0],g.graph[7],g.graph[8])!)
print(g.findLCA(g.graph[0],g.graph[1],g.graph[8])!)
