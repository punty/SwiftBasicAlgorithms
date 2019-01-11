//
//  Digraph+DAG.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 10/01/2019.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

extension Digraph {
    
    func findDag() -> Stack<Int> {
        var visited = Array<Bool>(repeating: false, count: count)
        var onStack = Array<Bool>(repeating: false, count: count)
        var edgesTo = Array<Int>(repeating: -1, count: count)
        var cycle = Stack<Int>()
        for idx in vertexesIndex {
            if !visited[idx] {
                findDag(root: idx, visited:&visited, edgesTo: &edgesTo, onStack: &onStack, cycle: &cycle)
            }
        }
        return cycle
    }
    
    private func findDag(root: Int,
                         visited: inout [Bool],
                         edgesTo: inout [Int],
                         onStack: inout [Bool],
                         cycle: inout Stack<Int>) {
        onStack[root] = true
        visited[root] = true
        for edge in self[root].edges {
            if !cycle.isEmpty {
                return
            } else if !visited[edge] {
                edgesTo[edge] = root
                findDag(root: edge,
                        visited: &visited,
                        edgesTo: &edgesTo,
                        onStack: &onStack,
                        cycle: &cycle)
            } else if onStack[edge] {
               var next = root
                while next != edge {
                    next = edgesTo[next]
                    cycle.push(next)
                }
                cycle.push(root)
            }
        }
        onStack[root] = false
    }
}
