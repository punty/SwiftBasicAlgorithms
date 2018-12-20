
import Foundation

extension UndirectedGraph {
    func connectedComponents() -> [Int] {
        var connectedComponent = Array<Int>(repeating: 0, count: count)
        var visited = Array<Bool>(repeating: false, count: count)
        var cId = 0
        for idx in vertexesIndex {
            if !visited[idx] {
                dfs(vertex: idx, visited: &visited) { (idx, _) in
                    connectedComponent[idx] = cId
                }
                cId += 1
            }
        }
        return connectedComponent
    }
}
