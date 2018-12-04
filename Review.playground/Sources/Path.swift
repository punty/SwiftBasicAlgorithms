import Foundation

public class Path<T: Hashable> {
    private var visited: [Bool]
    private var edgesTo: [Int]
    private let graph: Graph<T>
    private let start: Graph<T>.Vertex
    
    public enum Search {
        case dfs
        case bfs
    }
    
    public init (graph: Graph<T>, start: Graph<T>.Vertex, type: Search) {
        self.graph = graph
        self.start = start
        self.visited = Array<Bool>(repeating: false, count: graph.count)
        self.edgesTo = Array<Int>(repeating: -1, count: graph.count)
        switch type {
        case .bfs:
            bfs(vertex: start)
        case .dfs:
            dfs(vertex: start)
        }
    }
    
    private func dfs(vertex: Graph<T>.Vertex) {
        visited[vertex.index] = true
        for edge in graph[vertex.index].edges {
            if !visited[edge.to.index] {
                dfs(vertex: edge.to)
                edgesTo[edge.to.index] = vertex.index
            }
        }
    }
    
    private func bfs(vertex: Graph<T>.Vertex) {
        var queue = [Int]()
        queue.append(vertex.index)
        visited[vertex.index] = true
        while !queue.isEmpty {
            let idx = queue.removeFirst()
            for edge in graph[idx].edges {
                if !visited[edge.to.index] {
                    queue.append(edge.to.index)
                    visited[edge.to.index] = true
                    edgesTo[edge.to.index] = idx
                }
            }
        }
    }
}

public extension Path {
   public func path(to: Graph<T>.Vertex) -> [Graph<T>.Vertex] {
        if visited[to.index] {
            var path = [Graph<T>.Vertex]()
            var next = to
            while next != start {
                path.append(next)
                let nextIndex = edgesTo[next.index]
                guard nextIndex >= 0 else { return [] }
                next = graph[nextIndex].vertex
            }
            return path
        }
        return []
    }
}
