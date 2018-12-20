
import XCTest

class ConnectedComponentTests: XCTestCase {
    lazy var graph: UndirectedGraph<Int> = {
        var simpleGraph = UndirectedGraph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        let v5 = simpleGraph.createVertex(data: 5)
        simpleGraph.createEdge(from: v0, to: v1)
        simpleGraph.createEdge(from: v1, to: v3)
        simpleGraph.createEdge(from: v3, to: v2)
        simpleGraph.createEdge(from: v0, to: v2)
        simpleGraph.createEdge(from: v4, to: v5)
        return simpleGraph
    }()
    
    func testConnectedComponent() {
        XCTAssertEqual(graph.connectedComponents(), [0,0,0,0,1,1])
    }

}
