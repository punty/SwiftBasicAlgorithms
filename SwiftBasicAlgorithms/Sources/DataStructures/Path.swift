import Foundation

public struct Path<T: Hashable> {
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
            bfs(vertex: start.index)
        case .dfs:
            dfs(vertex: start.index)
        }
    }
    
    private mutating func dfs(vertex: Int) {
        visited[vertex] = true
        for edge in graph[vertex].edges {
            if !visited[edge] {
                dfs(vertex: edge)
                edgesTo[edge] = vertex
            }
        }
    }
    
    private mutating func bfs(vertex: Int) {
        var queue = Queue<Int>()
        queue.enqueue(vertex)
        visited[vertex] = true
        while let idx = queue.dequeue() {
            for edge in graph[idx].edges {
                if !visited[edge] {
                    queue.enqueue(edge)
                    visited[edge] = true
                    edgesTo[edge] = idx
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
