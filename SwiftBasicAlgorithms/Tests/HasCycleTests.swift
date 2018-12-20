//
//  HasCycleTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 15/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import XCTest

class HasCycleTests: XCTestCase {

    func testHasCycle() {
        var g = UndirectedGraph<Int>()
        let v0 = g.createVertex(data: 0)
        let v1 = g.createVertex(data: 1)
        let v2 = g.createVertex(data: 2)
        let v3 = g.createVertex(data: 3)
        let v4 = g.createVertex(data: 4)
        let v5 = g.createVertex(data: 5)
        let v6 = g.createVertex(data: 6)
        g.createEdge(from: v0, to: v1)
        g.createEdge(from: v0, to: v2)
        g.createEdge(from: v0, to: v5)
        g.createEdge(from: v0, to: v6)
        g.createEdge(from: v1, to: v3)
        g.createEdge(from: v2, to: v3)
        g.createEdge(from: v2, to: v4)
        g.createEdge(from: v4, to: v5)
        g.createEdge(from: v4, to: v6)
        XCTAssertTrue(g.hasCycle())
    }
    
    func testNotHasCycle() {
        var g = UndirectedGraph<Int>()
        let v0 = g.createVertex(data: 0)
        let v1 = g.createVertex(data: 1)
        let v2 = g.createVertex(data: 2)
        let v3 = g.createVertex(data: 3)
        let v4 = g.createVertex(data: 4)
        let v5 = g.createVertex(data: 5)
        let v6 = g.createVertex(data: 6)
        g.createEdge(from: v0, to: v1)
        g.createEdge(from: v0, to: v5)
        g.createEdge(from: v1, to: v3)
        g.createEdge(from: v2, to: v3)
        g.createEdge(from: v4, to: v5)
        g.createEdge(from: v4, to: v6)
        XCTAssertFalse(g.hasCycle())
    }

}
