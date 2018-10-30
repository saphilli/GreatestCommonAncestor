//
//  Graph.swift
//  
//
//  Created by Sarah Phillips
//
import Foundation

public class Graph<T>: CustomStringConvertible {
    var graph:Array<Vertex<T>>
    init(_ data: T) {
        graph = []   //the graph is represented as an array of vertices
        let v = Vertex(0,data)
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
    func addVertex(_ data: T)  {
        let key = (graph.count)
        let newVertex: Vertex = Vertex<T>(key,data) //set the key
        graph.append(newVertex) //add the vertex to the vertex array
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
        if (src === dst) {
            path.append(src)
            correctPaths.append(path)
            return correctPaths
        }
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
    
    func findLCA(_ v:Vertex<T>,_ v1: Vertex<T>,_ v2: Vertex<T>) -> Vertex<T>{
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
        var lca = graph[0]
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
                lca = v
            }
        }
        return lca
    }
}
