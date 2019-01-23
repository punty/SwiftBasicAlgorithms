
import Foundation

extension UndirectedGraph where T == Int {
    //Use n,m Erdős–Rényi a graph is chosen uniformly at random from the collection of all graphs which have n nodes and M edges
    static func generate(n: Int, M: Int) -> UndirectedGraph {
        var graph = UndirectedGraph()
        let vertexRange = 0..<n
        for idx in vertexRange {
            _ = graph.createVertex(data: idx)
        }
        var edges = 0
        while edges < M {
            let s = Int.random(in: vertexRange)
            let t = Int.random(in: vertexRange)
            let alreadyConnected = graph[s].edges.contains(t) || graph[t].edges.contains(s)
            if s != t && !alreadyConnected {
                graph.createEdge(from: graph[s].vertex, to: graph[t].vertex)
                edges += 1
            }
        }
        return graph
    }
    
    //Use n,p Erdős–Rényi: a graph is constructed by connecting nodes randomly. Each edge is included in the graph with probability p independent from every other edge.
    static func generate(n: Int, p: Double) -> UndirectedGraph {
        var graph = UndirectedGraph()
        let vertexRange = 0..<n
        for idx in vertexRange {
            _ = graph.createVertex(data: idx)
        }
        for idx in vertexRange {
            for jdx in idx+1..<n {
                if Double.random(in: 0..<1) < p {
                    let alreadyConnected = graph[idx].edges.contains(jdx) || graph[jdx].edges.contains(idx)
                    if !alreadyConnected {
                        graph.createEdge(from: graph[idx].vertex, to: graph[jdx].vertex)
                    }
                }
            }
        }
        return graph
    }
}
