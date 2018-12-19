
import Foundation

//Fleury’s Algorithm
extension Graph.EdgeList {
    var degree: Int {
        return edges.count
    }
}

extension Graph {
    
    private func nextEdge(graph: Graph, start: Int) -> Int {
        let edgeList = graph[start]
        if edgeList.degree == 1 {
            guard let edge = edgeList.edges.first else {fatalError()}
            return edge
        }
        var nextEdge = -1
        for edge in edgeList.edges {
            if !isEdgeABridge(graph: graph, start: start, edge: edge) {
                return edge
            }
            nextEdge = edge
        }
        assert(nextEdge >= 0)
        return nextEdge
    }
    
    private func isEdgeABridge(graph: Graph, start: Int, edge: Int) -> Bool {
        var g = graph
        let count = g.countComponents(graph: graph, start: start)
        g.removeEdges(from: start, to: edge)
        let countAfter = g.countComponents(graph: graph, start: start)
        g.createEdges(from: start, to: edge)
        return countAfter < count
    }
    
    private func countComponents(graph: Graph, start: Int) -> Int {
        var visited = Array<Bool>(repeating: false, count: count)
        var components = 0
        graph.dfs(vertex: start, visited: &visited) { _, _ in
            components += 1
        }
        return components
    }
    
    private func hasUnusedEdges(graph: Graph)-> Bool {
        for el in graph {
            if el.degree > 0 {
                return true
            }
        }
        return false
    }
    
    func eulerianPath() -> [Int]? {
        guard !isEmpty else { return nil }
        let oddCount = filter { $0.degree % 2 != 0 }.count
        guard oddCount <= 2 else {
            //No path when oddcount>2
            return nil
        }
        //find a start for our path
        var start = first { $0.degree % 2 != 0 }?.vertex
        if start == nil {
            start = first { $0.degree > 0 }?.vertex
        }
        var startVertex = start?.index ?? self[0].vertex.index
        var graph = self
        var path:[Int] = [startVertex]
        while hasUnusedEdges(graph: graph) {
            let next = nextEdge(graph: graph, start: startVertex)
            path.append(next)
            graph.removeEdges(from: startVertex, to: next)
            startVertex = next
        }
        return path
    }
}
