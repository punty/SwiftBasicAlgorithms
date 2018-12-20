
import Foundation

struct UndirectedGraph<T>: Graph {
    
    var adjacencyList: [EdgeList<T>] = []
    
    mutating func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    mutating func removeEdge(from: Int, to: Int) {
        guard var edjesFrom = adjacencyList[safe: from],
            var edjesTo = adjacencyList[safe: to] else {return}
        edjesFrom.edges.remove(to)
        edjesTo.edges.remove(from)
        adjacencyList[from] = edjesFrom
        adjacencyList[to] = edjesTo
    }
    
    mutating func createEdge(from: Int, to: Int) {
        guard var edjesFrom = adjacencyList[safe: from],
            var edjesTo = adjacencyList[safe: to] else {return}
        edjesFrom.edges.insert(to)
        edjesTo.edges.insert(from)
        adjacencyList[from] = edjesFrom
        adjacencyList[to] = edjesTo
    }
}
