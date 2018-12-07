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

public struct Graph<T: Hashable> {
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
    
    final class EdgeList {
        static func == (lhs: EdgeList, rhs: EdgeList) -> Bool {
            return lhs.vertex == rhs.vertex
        }
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.vertex)
        }
        let vertex: Vertex
        var edges: Set<Int> = []
        var weights: [Int: Double] = [:]
        init (vertex: Vertex) {
            self.vertex = vertex
        }
    }
    
    private var adjacencyList: [EdgeList] = []
    
    public mutating func createVertex(data: T) -> Vertex {
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    public func createEdges(from: Vertex, to: Vertex, weight: Double = 1.0) {
        guard let edjesFrom = adjacencyList[safe: from.index],
            let edjesTo = adjacencyList[safe: to.index] else {return}
        edjesFrom.edges.insert(to.index)
        edjesFrom.weights[to.index] = weight
        edjesTo.edges.insert(from.index)
        edjesTo.weights[from.index] = weight
    }
}
