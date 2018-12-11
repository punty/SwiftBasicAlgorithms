//
//  ConnectedComponentTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 11/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import XCTest

class ConnectedComponentTests: XCTestCase {
    lazy var graph: Graph<Int> = {
        var simpleGraph = Graph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        let v5 = simpleGraph.createVertex(data: 5)
        simpleGraph.createEdges(from: v0, to: v1)
        simpleGraph.createEdges(from: v1, to: v3)
        simpleGraph.createEdges(from: v3, to: v2)
        simpleGraph.createEdges(from: v0, to: v2)
        simpleGraph.createEdges(from: v4, to: v5)
        return simpleGraph
    }()
    
    func testConnectedComponent() {
        let c = ConnectedComponent(graph: graph)
        XCTAssertEqual(c.connectedComponent, [0,0,0,0,1,1])
    }

}
