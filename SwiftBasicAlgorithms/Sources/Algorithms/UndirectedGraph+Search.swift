
import Foundation

extension UndirectedGraph {
    func dfs(vertex: Int, visited: inout [Bool], visit: (Int, Int?)->Void) {
        var stack = Stack<(Int, Int?)>()
        if !visited[vertex] {
            stack.push((vertex, nil))
        }
        while !stack.isEmpty {
            guard let el = stack.pop() else {
                fatalError("if stack is not empty should have at least one item")
            }
            if !visited[el.0] {
                visited[el.0] = true
                visit(el.0, el.1)
            }
            for edge in self[el.0].edges {
                if !visited[edge] {
                    stack.push((edge,el.0))
                }
            }
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
