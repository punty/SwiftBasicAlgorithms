//
//  BipartiteGraph.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 12/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

class BipartiteGraph<T: Hashable>: Search {
    var visited: [Bool]
    var graph: Graph<T>
    init (graph: Graph<T>) {
        self.graph = graph
        visited = Array<Bool>(repeating: false, count: graph.count)
       
    }
    
    func isBipartite() -> Bool {
        // TODO: implement
        return false
    }
}
