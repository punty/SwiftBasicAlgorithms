
import Foundation

extension UndirectedGraph {
    func isBipartite() -> Bool {
        if self.count == 0 {
            return true
        }
        var color = Array<Int>(repeating: -1, count: self.count)
        for idx in self.vertexesIndex {
            if color[idx] < 0 {
                if !isBipartite(start: idx, color: &color) {
                    return false
                }
            }
        }
        return true
    }
    
    private func isBipartite(start: Int, color:inout [Int]) -> Bool {
        color[start] = 1
        var queue = Queue<Int>()
        queue.enqueue(start)
        while let idx = queue.dequeue() {
            for edge in self[idx].edges {
                if color[edge] < 0 {
                    queue.enqueue(edge)
                    color[edge] = 1 - color[idx]
                } else {
                    if color[edge] == color[idx] {
                        return false
                    }
                }
            }
        }
        return true
    }
}
