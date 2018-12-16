
import Foundation

//Fleury’s Algorithm

extension Graph.EdgeList {
    var degree: Int {
        return edges.count
    }
}

extension Graph {
    func eulerianPath() -> [Vertex]? {
        guard !isEmpty else { return nil }
        let oddCount = filter { $0.degree % 2 != 0 }.count
        guard oddCount <= 2 else {
            //No path when oddcount>2
            return nil
        }
        //find a start for our path
        var start = first { $0.degree % 2 != 0 }?.vertex
        if start == nil {
            start = first { $0.degree > 0 }?.vertex
        }
        let startVertex = start ?? self[0].vertex
        
        return [/* TODO */]
    }
}
