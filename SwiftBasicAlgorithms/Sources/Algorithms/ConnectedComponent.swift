//
//  ConnectedComponent.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 11/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

class ConnectedComponent<T: Hashable>: Search {  
    var visited: [Bool]
    var connectedComponent: [Int] = []
    var graph: Graph<T>
    init (graph: Graph<T>) {
        self.graph = graph
        connectedComponent = Array<Int>(repeating: 0, count: graph.count)
        visited = Array<Bool>(repeating: false, count: graph.count)
        connected()
    }
    
    private func connected() {
        var cId = 0
        for idx in graph.vertexesIndex {
            if !visited[idx] {
                dfs(vertex: idx) { (idx, _) in
                    self.connectedComponent[idx] = cId
                }
                cId += 1
            }
        }
    }
}
