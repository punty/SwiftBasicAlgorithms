//
//  GraphTestData.swift
//  SwiftBasicAlgorithmsTests
//
//  Created by Francesco Puntillo on 16/01/2019.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation
import XCTest

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
