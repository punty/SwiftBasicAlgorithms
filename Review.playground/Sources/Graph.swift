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
                d.append("[\(e.to.data) (\(e.weight))]")
            }
            d.append("\n")
        }
        return d
    }
}

public final class Graph<T: Hashable> {
    public init() {}
    public struct Vertex: Hashable {
        var data: T
        var index: Int
    }
    
    subscript (index: Int) -> EdgeList {
        return adjacencyList[index]
    }
    
    var count: Int {
        return adjacencyList.count
    }
    
    public struct Edge: Hashable {
        let to: Vertex
        var weight: Double
        
        init(to: Vertex, weight: Double = 1.0) {
            self.to = to
            self.weight = weight
        }
    }
    
    final class EdgeList: Hashable {
        static func == (lhs: EdgeList, rhs: EdgeList) -> Bool {
            return lhs.vertex == rhs.vertex
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.vertex)
        }
        
        let vertex: Vertex
        var edges: Set<Edge> = []
        init (vertex: Vertex) {
            self.vertex = vertex
        }
    }
    
    private var adjacencyList: [EdgeList] = []
    
    public func createVertex(data: T) -> Vertex {
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    public func createEdges(from: Vertex, to: Vertex, weight: Double = 1.0) {
        guard let edjesFrom = adjacencyList[safe: from.index],
            let edjesTo = adjacencyList[safe: to.index] else {return}
        edjesFrom.edges.insert(Edge(to: to, weight: weight))
        edjesTo.edges.insert(Edge(to: from, weight: weight))
    }
}
