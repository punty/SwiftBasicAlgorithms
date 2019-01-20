
import Foundation

enum DFSOrder {
    case pre
    case post
    var isPre: Bool {
        switch self {
        case .post:
            return false
        case .pre:
            return true
        }
    }
}

extension Graph {
    
    func dfs(vertex: Int, order: DFSOrder, visited: inout [Bool], visit: (Int, Int?)->Void) {
        if order.isPre {
            visited[vertex] = true
            visit(vertex, nil)
        }
        for edge in self[vertex].edges {
            if !visited[edge]{
                dfs(vertex: edge, order: order, visited: &visited, visit: visit)
            }
        }
        if !order.isPre {
            visited[vertex] = true
            visit(vertex, nil)
        }
    }
    
    func bfs(vertex: Int, visited: inout [Bool], visit: (Int, Int?)->Void) {
        var queue = Queue<Int>()
        if !visited[vertex] {
            queue.enqueue(vertex)
            visited[vertex] = true
            visit(vertex, nil)
        }
        while let idx = queue.dequeue() {
            for edge in self[idx].edges {
                if !visited[edge] {
                    queue.enqueue(edge)
                    visited[edge] = true
                    visit(edge, idx)
                }
            }
        }
    }
}
