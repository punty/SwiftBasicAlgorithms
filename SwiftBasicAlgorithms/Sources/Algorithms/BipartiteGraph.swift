//
//  BipartiteGraph.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 12/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

class BipartiteGraph<T: Hashable> {
    var visited: [Bool]
    var graph: Graph<T>
   
    init (graph: Graph<T>) {
        self.graph = graph
        visited = Array<Bool>(repeating: false, count: graph.count)
        
    }
    
    func isBipartite() -> Bool {
        var color = Array<Int>(repeating: -1, count: graph.count)
        if graph.count <= 4 {
            return graph.count == 2
        }
        color[0] = 1
        var queue = Queue<Int>()
        queue.enqueue(0)
        while let idx = queue.dequeue() {
            for edge in graph[idx].edges {
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
