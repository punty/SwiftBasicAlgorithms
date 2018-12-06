//
//  SwiftBasicAlgorithmsTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 06/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import XCTest

class SwiftBasicAlgorithmsTests: XCTestCase {

    func testBasicBFS() {
        var g = Graph<Int>()
        let v0 = g.createVertex(data: 0)
        let v1 = g.createVertex(data: 1)
        let v2 = g.createVertex(data: 2)
        let v3 = g.createVertex(data: 3)
        let v4 = g.createVertex(data: 4)
        let v5 = g.createVertex(data: 5)
        let v6 = g.createVertex(data: 6)
        let v7 = g.createVertex(data: 7)
        let v8 = g.createVertex(data: 8)
        let v9 = g.createVertex(data: 9)
        g.createEdges(from: v0, to: v2)
        g.createEdges(from: v2, to: v7)
        g.createEdges(from: v7, to: v8)
        g.createEdges(from: v0, to: v9)
        g.createEdges(from: v0, to: v1)
        g.createEdges(from: v1, to: v3)
        g.createEdges(from: v3, to: v4)
        g.createEdges(from: v3, to: v6)
        g.createEdges(from: v4, to: v5)
        g.createEdges(from: v0, to: v2)
        let path = Path(graph: g, start: v0, type: .bfs)
        XCTAssertTrue(path.path(to: v6).count == 3)
        print(path.path(to: v6))
    }

}
