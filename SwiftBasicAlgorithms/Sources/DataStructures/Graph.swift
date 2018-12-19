
import Foundation
    
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Graph: CustomStringConvertible {
    public var description: String {
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

struct Graph<T>: Collection {
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return adjacencyList.endIndex
    }
    
    init() {}
    
    init(from: Graph) {
        adjacencyList = from.adjacencyList
    }
    
    struct Vertex {
        var data: T
        var index: Int
    }
    
    subscript (index: Int) -> EdgeList {
        return adjacencyList[index]
    }
    
   
    var vertexes: [Vertex]  {
        return adjacencyList.map { $0.vertex }
    }
    
    var vertexesIndex: [Int]  {
        return adjacencyList.map { $0.vertex.index }
    }
    
    final class EdgeList {
        let vertex: Vertex
        var edges: Set<Int> = []
        var weights: [Int: Double] = [:]
        init (vertex: Vertex) {
            self.vertex = vertex
        }
    }
    
    private var adjacencyList: [EdgeList] = []
    
    mutating func createVertex(data: T) -> Vertex {
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    func createEdges(from: Vertex, to: Vertex, weight: Double = 1.0) {
        guard let edjesFrom = adjacencyList[safe: from.index],
            let edjesTo = adjacencyList[safe: to.index] else {return}
        edjesFrom.edges.insert(to.index)
        edjesFrom.weights[to.index] = weight
        edjesTo.edges.insert(from.index)
        edjesTo.weights[from.index] = weight
    }
}
