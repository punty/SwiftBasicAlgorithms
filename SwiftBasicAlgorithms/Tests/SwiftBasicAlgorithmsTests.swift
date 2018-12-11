//
//  SwiftBasicAlgorithmsTests.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 06/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import XCTest

class SwiftBasicAlgorithmsTests: XCTestCase {
    func testBFSPerformance() {
        let numberOfVertex = 2000
        let numberOfEdges = 7000
        let g = Graph<Int>.generate(n: numberOfVertex, M: numberOfEdges)
        let p = Path(graph: g, start: g[0].vertex, type: .bfs)
        measure {
            let pathTo = Int.random(in: 1..<numberOfVertex)
            _ = p.path(to: g[pathTo].vertex)
        }
    }
}
