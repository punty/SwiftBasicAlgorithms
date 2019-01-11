
import Foundation

  var g = Digraph<Int>()
var v0 = g.createVertex(data: 0)
var v1 = g.createVertex(data: 1)
var v2 = g.createVertex(data: 2)
g.createEdge(from: 0, to: 1)
g.createEdge(from: 1, to: 2)
g.createEdge(from: 2, to: 0)
print(g.findDag())
