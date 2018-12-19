
import Foundation


var g = Graph<Int>()
let v0 = g.createVertex(data: 0)
let v1 = g.createVertex(data: 1)
let v2 = g.createVertex(data: 2)
g.createEdges(from: v1, to: v0)
g.createEdges(from: v1, to: v2)
g.createEdges(from: v2, to: v0)
print(g.eulerianPath())
