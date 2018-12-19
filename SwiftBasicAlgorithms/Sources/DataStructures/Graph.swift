
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
    
    struct EdgeList {
        let vertex: Vertex
        var edges: Set<Int> = []
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
    
    mutating func removeEdges(from: Int, to: Int) {
        guard var edjesFrom = adjacencyList[safe: from],
            var edjesTo = adjacencyList[safe: to] else {return}
        edjesFrom.edges.remove(to)
        edjesTo.edges.remove(from)
        adjacencyList[from] = edjesFrom
        adjacencyList[to] = edjesTo
    }
    
    mutating func createEdges(from: Int, to: Int) {
        guard var edjesFrom = adjacencyList[safe: from],
            var edjesTo = adjacencyList[safe: to] else {return}
        edjesFrom.edges.insert(to)
        edjesTo.edges.insert(from)
        adjacencyList[from] = edjesFrom
        adjacencyList[to] = edjesTo
    }
    
    mutating func createEdges(from: Vertex, to: Vertex, weight: Double = 1.0) {
        guard var edjesFrom = adjacencyList[safe: from.index],
            var edjesTo = adjacencyList[safe: to.index] else {return}
        edjesFrom.edges.insert(to.index)
        edjesTo.edges.insert(from.index)
        adjacencyList[from.index] = edjesFrom
        adjacencyList[to.index] = edjesTo
        
    }
}
