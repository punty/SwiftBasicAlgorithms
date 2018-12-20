
import Foundation

struct Digraph<T>: Graph {
    
    var adjacencyList: [EdgeList<T>] = []
    
    mutating func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    mutating func removeEdge(from: Int, to: Int) {
        guard var edjesFrom = adjacencyList[safe: from] else {return}
        edjesFrom.edges.remove(to)
        adjacencyList[from] = edjesFrom
    }
    
    mutating func createEdge(from: Int, to: Int) {
        guard var edjesFrom = adjacencyList[safe: from] else {return}
        edjesFrom.edges.insert(to)
        adjacencyList[from] = edjesFrom
    }
}
