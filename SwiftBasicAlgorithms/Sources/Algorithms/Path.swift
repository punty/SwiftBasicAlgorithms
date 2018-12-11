//
//  Path.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 11/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

struct Path<T: Hashable>: Search {
    var visited: [Bool] = []
    var edgesTo: [Int] = []
    var start: Graph<T>.Vertex
    var graph: Graph<T>
    
    init (graph: Graph<T>, start: Graph<T>.Vertex, type: SearchType) {
        self.graph = graph
        self.start = start
        switch type {
        case .bfs:
            (visited, edgesTo) = bfs(vertex: start.index)
        case .dfs:
            (visited, edgesTo) = dfs(vertex: start.index)
        }
    }
}

extension Path {
    public func path(to: Graph<T>.Vertex) -> [Graph<T>.Vertex] {
        if visited[to.index] {
            var path = [Graph<T>.Vertex]()
            var next = to
            while next != start {
                path.append(next)
                let nextIndex = edgesTo[next.index]
                guard nextIndex >= 0 else { return [] }
                next = graph[nextIndex].vertex
            }
            return path
        }
        return []
    }
}
