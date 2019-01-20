//
//  FindDirectedCycleTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 20/01/2019.
//  Copyright © 2019 FP. All rights reserved.
//

import XCTest

class FindDirectedCycleTests: XCTestCase {
    func testDagHasNoCycle() {
        let g = Digraph<Int>.create(from: TestData.DAG)
        XCTAssertTrue(g.findDirectedCycle().isEmpty)
    }
    
    func testGraphHasCycle() {
        let g = Digraph<Int>.create(from: TestData.directGraph)
        XCTAssertFalse(g.findDirectedCycle().isEmpty)
    }
}
