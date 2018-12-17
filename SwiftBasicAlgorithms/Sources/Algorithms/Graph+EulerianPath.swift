
import Foundation

//Fleury’s Algorithm

extension Graph.EdgeList {
    var degree: Int {
        return edges.count
    }
}


extension Graph {
    
    private func nextEdge(graph: inout Graph, start: Int) -> Int {
        let edgeList = self[start]
        if edgeList.degree == 1 {
            guard let edge = edgeList.edges.first else {fatalError()}
            return edge
        }
        var nextEdge = -1
        for edge in edgeList.edges {
            if isEdgeABridge(graph: &graph, start: start, edge: edge) {
                return edge
            }
            nextEdge = edge
        }
        return nextEdge
    }
    
    private func isEdgeABridge(graph: inout Graph, start: Int, edge: Int) -> Bool {
        let count = graph.countComponents(graph: &graph, start: start)
        graph[start].edges.remove(edge)
        graph[edge].edges.remove(start)
        let countAfter = graph.countComponents(graph: &graph, start: start)
        graph[start].edges.insert(edge)
        graph[edge].edges.insert(start)
        return count <= countAfter
    }
    
    private func countComponents(graph: inout Graph, start: Int) -> Int {
        var visited = Array<Bool>(repeating: false, count: count)
        var components = 0
        graph.dfs(vertex: start, visited: &visited) { _, _ in
            components += 1
        }
        return components
    }
    
    private func removeIsolatedVertex(graph: inout Graph) {
        let f = graph
            .filter { edgeList -> Bool in
                edgeList.degree > 0
            }
        graph.adjacencyList = f
    }
    
    private func removeEdge(graph: inout Graph, from: Int, to: Int) {
        graph[from].edges.remove(to)
        graph[to].edges.remove(from)
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
        while !graph.isEmpty {
            let next = nextEdge(graph: &graph, start: startVertex)
            path.append(next)
            removeEdge(graph: &graph, from: startVertex, to: next)
            startVertex = next
        }
        
        return path
    }
}
