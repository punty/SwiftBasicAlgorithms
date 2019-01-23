
import Foundation

class Path<T: Hashable> {
    var visited: [Bool]
    var edgesTo: [Int]
    var start: Vertex<T>
    var graph: UndirectedGraph<T>
    
    init (graph: UndirectedGraph<T>, start: Vertex<T>) {
        self.graph = graph
        self.start = start
        self.visited = Array<Bool>(repeating: false, count: graph.count)
        self.edgesTo = Array<Int>(repeating: -1, count: graph.count)
        let visit = { (idx: Int, from: Int?) in
            self.edgesTo[idx] = from ?? -1
        }
        graph.bfs(vertex: start.index, visited: &visited, visit: visit)
    }
}

extension Path {
    public func path(to: Vertex<T>) -> [Vertex<T>] {
        if visited[to.index] {
            var path = [Vertex<T>]()
            var next = to
            while next.index != start.index {
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
