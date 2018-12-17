
import Foundation

//Fleury’s Algorithm

extension Graph.EdgeList {
    var degree: Int {
        return edges.count
    }
}


extension Graph {
    
    private func nextEdge(start: Int) -> Int {
        let edgeList = self[start]
        if edgeList.degree == 1 {
            guard let edge = edgeList.edges.first else {fatalError()}
            return edge
        }
        
        return -1
    }
    
    private func countComponents(start: Int) -> Int {
        var visited = Array<Bool>(repeating: false, count: count)
        var components = 0
        dfs(vertex: start, visited: &visited) { _, _ in
            components += 1
        }
        return components
    }
    
    
    /*
   
     
     // 2) If there are multiple adjacents, then
     // u-v is not a bridge Do following steps
     // to check if u-v is a bridge
     // 2.a) count of vertices reachable from u
     boolean[] isVisited = new boolean[this.vertices];
     int count1 = dfsCount(u, isVisited);
     
     // 2.b) Remove edge (u, v) and after removing
     //  the edge, count vertices reachable from u
     removeEdge(u, v);
     isVisited = new boolean[this.vertices];
     int count2 = dfsCount(u, isVisited);
     
     // 2.c) Add the edge back to the graph
     addEdge(u, v);
     return (count1 > count2) ? false : true;
     }
     */
    
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
