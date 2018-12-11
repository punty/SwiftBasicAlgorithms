import Foundation

enum SearchType {
    case dfs
    case bfs
}

protocol Search {
    associatedtype T: Hashable
    var graph: Graph<T> { get }
    func dfs(vertex: Int, visited:inout [Bool], visit: (Int, Int?)->Void)
    func bfs(vertex: Int, visited:inout [Bool], visit: (Int, Int?)->Void)
}

extension Search {
    
    func dfs(vertex: Int, visited:inout [Bool], visit: (Int, Int?)->Void) {
        var stack = Stack<(Int, Int?)>()
        stack.push((vertex, nil))
        while !stack.isEmpty {
            guard let el = stack.pop() else { fatalError("if stack is not empty should have at least one item") }
            if !visited[el.0] {
                visited[el.0] = true
                visit(el.0, el.1)
            }
            for edge in graph[el.0].edges {
                if !visited[edge] {
                    stack.push((edge,el.0))
                }
            }
        }
    }
    
    func bfs(vertex: Int, visited:inout [Bool], visit: (Int, Int?)->Void) {
        var queue = Queue<Int>()
        queue.enqueue(vertex)
        visited[vertex] = true
        visit(vertex, nil)
        while let idx = queue.dequeue() {
            for edge in graph[idx].edges {
                if !visited[edge] {
                    queue.enqueue(edge)
                    visited[edge] = true
                    visit(edge, idx)
                }
            }
        }
    }
}
