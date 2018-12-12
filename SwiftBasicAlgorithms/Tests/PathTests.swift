//
//  PathTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 11/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import XCTest

class PathTests: XCTestCase {

    lazy var graph: Graph<Int> = {
        var simpleGraph = Graph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        simpleGraph.createEdges(from: v0, to: v1)
        simpleGraph.createEdges(from: v0, to: v2)
        simpleGraph.createEdges(from: v2, to: v1)
        simpleGraph.createEdges(from: v0, to: v3)
        simpleGraph.createEdges(from: v1, to: v4)
        return simpleGraph
    }()
    
    func testPath() {
        let p = Path(graph: graph, start: graph[0].vertex, type: .bfs)
        let pa = p.path(to: graph[4].vertex)
        XCTAssertEqual(pa.map {$0.index}, [4,1])
    }

}
