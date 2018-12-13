//
//  main.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 06/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

var simpleGraph = Graph<Int>()
let v0 = simpleGraph.createVertex(data: 0)
let v1 = simpleGraph.createVertex(data: 1)
let v2 = simpleGraph.createVertex(data: 2)
let v3 = simpleGraph.createVertex(data: 3)
let v4 = simpleGraph.createVertex(data: 4)
simpleGraph.createEdges(from: v0, to: v3)
simpleGraph.createEdges(from: v1, to: v3)
simpleGraph.createEdges(from: v2, to: v4)
simpleGraph.createEdges(from: v3, to: v3)
simpleGraph.createEdges(from: v2, to: v3)
let b = BipartiteGraph(graph: simpleGraph)
print(b.isBipartite())

