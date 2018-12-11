import Foundation

enum SearchType {
    case dfs
    case bfs
}

protocol Search {
    associatedtype T: Hashable
    var graph: Graph<T> { get }
    func dfs(vertex: Int) -> (visited: [Bool], edgesTo: [Int])
    func bfs(vertex: Int) -> (visited: [Bool], edgesTo: [Int])
}

extension Search {
    func dfs(vertex: Int) -> (visited: [Bool], edgesTo: [Int]) {
        var visited = Array<Bool>(repeating: false, count: graph.count)
        var edgesTo = Array<Int>(repeating: -1, count: graph.count)
        var stack = Stack<Int>()
        stack.push(vertex)
        while !stack.isEmpty {
            guard let el = stack.top else { fatalError("if stack is not empty should have at least one item") }
            visited[el] = true
            for edge in graph[el].edges {
                if !visited[edge] {
                    stack.push(edge)
                    edgesTo[edge] = vertex
                }
            }
        }
        return (visited, edgesTo)
    }
    
    func bfs(vertex: Int) -> (visited: [Bool], edgesTo: [Int]) {
        var visited = Array<Bool>(repeating: false, count: graph.count)
        var edgesTo = Array<Int>(repeating: -1, count: graph.count)
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
        return (visited, edgesTo)
    }
}
