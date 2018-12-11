//
//  ConnectedComponent.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 11/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

// TODO: Implement Connected Component Algorithm
struct ConnectedComponent<T: Hashable>: Search {
    var visited: [Bool] = []
    var edgesTo: [Int] = []
    var connectedComponent: [Int] = []
    var graph: Graph<T>
    init (graph: Graph<T>) {
        self.graph = graph
    }
}
