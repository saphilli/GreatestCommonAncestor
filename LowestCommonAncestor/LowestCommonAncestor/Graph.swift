//
//  Graph.swift
//  
//
//  Created by Sarah Phillips
//
import Foundation

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
        var key = g.count-1
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
  
}
