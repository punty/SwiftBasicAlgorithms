
import Foundation

protocol Graph: Collection, CustomStringConvertible {
    associatedtype T
    var adjacencyList: [EdgeList<T>] { get }
    mutating func createVertex(data: T) -> Vertex<T>
    mutating func createEdge(from: Int, to: Int)
    mutating func removeEdge(from: Int, to: Int)
}

extension Graph {
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return adjacencyList.endIndex
    }
    
    var vertexes: [Vertex<T>]  {
        return adjacencyList.map { $0.vertex }
    }
    
    var vertexesIndex: [Int]  {
        return adjacencyList.map { $0.vertex.index }
    }
    
    subscript (index: Int) -> EdgeList<T> {
        return adjacencyList[index]
    }
    
    mutating func createEdge(from: Vertex<T>, to: Vertex<T>) {
        createEdge(from: from.index, to: to.index)
    }
    
    mutating func removeEdge(from: Vertex<T>, to: Vertex<T>) {
        removeEdge(from: from.index, to: to.index)
    }
    
    var description: String {
        var d = ""
        for l in adjacencyList {
            d.append("\(l.vertex.data) -> ")
            for e in l.edges {
                d.append("[\(e)]")
            }
            d.append("\n")
        }
        return d
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
