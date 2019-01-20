//
//  Digraph+TopologicalSort.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 10/01/2019.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

extension Digraph {
    //Topological sort is basically a reversed postorder trasversal
    func topologicalSort() -> [Int] {
        var visited = Array<Bool>(repeating: false, count: count)
        var postOrder = [Int]()
        for idx in vertexesIndex {
            if !visited[idx] {
                dfs(vertex: idx, order: .post, visited: &visited) { (i, _) in
                    postOrder.append(i)
                }
            }
        }
        //This is taking O(n) can we find a better way?
        return postOrder.reversed()
    }
}
