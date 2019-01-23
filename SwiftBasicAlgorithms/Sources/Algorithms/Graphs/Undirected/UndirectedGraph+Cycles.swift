
import Foundation

extension UndirectedGraph {
    /**
     Check if the UndirectedGraph has at least one undirected cycle
     - returns:
     Returns true if a cycle has being found
     */
    func hasCycle() -> Bool {
        var visited = Array<Bool>(repeating: false, count: count)
        for idx in vertexesIndex {
            if !visited[idx] {
                if hasCycle(vertex:idx, visited: &visited) {
                    return true
                }
            }
        }
        return false
    }
    
    private func hasCycle(vertex: Int, visited:inout [Bool]) -> Bool {
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
            }
            for edge in self[el.0].edges {
                if !visited[edge] {
                    stack.push((edge,el.0))
                } else if el.1 != edge {
                    return true
                }
            }
        }
        return false
    }
    
}
