//
//  EulerianPathTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 18/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import XCTest

class EulerianPathTests: XCTestCase {
    func testPathLong() {
        var g = UndirectedGraph<Int>()
        let v0 = g.createVertex(data: 0)
        let v1 = g.createVertex(data: 1)
        let v2 = g.createVertex(data: 2)
        let v3 = g.createVertex(data: 3)
        let v4 = g.createVertex(data: 4)
        g.createEdge(from: v1, to: v0)
        g.createEdge(from: v0, to: v2)
        g.createEdge(from: v2, to: v1)
        g.createEdge(from: v0, to: v3)
        g.createEdge(from: v3, to: v4)
        g.createEdge(from: v3, to: v2)
        g.createEdge(from: v3, to: v1)
        g.createEdge(from: v2, to: v4)
        XCTAssertEqual(g.eulerianPath()?.count, 9)
    }
    
    func testPathShort() {
        var g = UndirectedGraph<Int>()
        let v0 = g.createVertex(data: 0)
        let v1 = g.createVertex(data: 1)
        let v2 = g.createVertex(data: 2)
        g.createEdge(from: v1, to: v0)
        g.createEdge(from: v1, to: v2)
        g.createEdge(from: v2, to: v0)
        XCTAssertEqual(g.eulerianPath()?.count, 4)
    }
}
