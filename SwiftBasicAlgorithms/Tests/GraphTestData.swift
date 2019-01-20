//
//  GraphTestData.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 16/01/2019.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation
import XCTest

struct TestData {

static let topologicalSort = """
5
0 1
0 2
1 2
1 3
2 3
2 4
"""

static let DAG = """
13
2 3
0 6
0 1
2 0
11 12
9 12
9 10
9 11
3 5
8 7
5 4
0 5
6 4
6 9
7 6
"""

static let directGraph = """
13
4 2
2 3
3 2
6 0
0 1
2 0
11 12
12 9
9 10
9 11
8 9
10 12
11 4
4 3
3 5
7 8
8 7
5 4
0 5
6 4
6 9
7 6
"""
}

extension Graph where Self.T == Int {
    static func create(from string: String) -> Self {
        var g = Self()
        let graphData = string.components(separatedBy: CharacterSet.newlines)
        guard let vertexCount = Int(graphData[0]) else { fatalError() }
        (0..<vertexCount).forEach { idx in
            g.createVertex(data: idx)
        }
        graphData
            .dropFirst()
            .forEach { string in
                let edge = string.split(separator: " ")
                guard edge.count == 2,
                    let first = Int(edge[0]),
                    let second = Int(edge[1]) else { return }
                g.createEdge(from: first, to: second)
        }
        return g
    }
}
