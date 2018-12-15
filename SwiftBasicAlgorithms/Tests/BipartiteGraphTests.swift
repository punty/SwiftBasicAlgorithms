
import XCTest

class BipartiteGraphTests: XCTestCase {
    
    func testBipartiteFails() {
        var simpleGraph = Graph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        simpleGraph.createEdges(from: v0, to: v3)
        simpleGraph.createEdges(from: v1, to: v3)
        simpleGraph.createEdges(from: v2, to: v4)
        simpleGraph.createEdges(from: v3, to: v3)
        simpleGraph.createEdges(from: v2, to: v3)
        XCTAssertFalse(simpleGraph.isBipartite())
    }

    func testBipartite() {
        var simpleGraph = Graph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        simpleGraph.createEdges(from: v0, to: v3)
        simpleGraph.createEdges(from: v1, to: v3)
        simpleGraph.createEdges(from: v2, to: v4)
        simpleGraph.createEdges(from: v2, to: v3)
        XCTAssertTrue(simpleGraph.isBipartite())
    }
    
    func testEmptyGraph() {
        let simpleGraph = Graph<Int>()
        XCTAssertTrue(simpleGraph.isBipartite())
    }
    
    func testNotStronglyConnectedGraph() {
        var simpleGraph = Graph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        let v5 = simpleGraph.createVertex(data: 5)
        let v6 = simpleGraph.createVertex(data: 6)
        simpleGraph.createEdges(from: v0, to: v3)
        simpleGraph.createEdges(from: v1, to: v3)
        simpleGraph.createEdges(from: v2, to: v4)
        simpleGraph.createEdges(from: v2, to: v3)
        simpleGraph.createEdges(from: v5, to: v6)
        XCTAssertTrue(simpleGraph.isBipartite())
    }

    func testNotStronglyConnectedGraphNotBipartite() {
        var simpleGraph = Graph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        let v5 = simpleGraph.createVertex(data: 5)
        let v6 = simpleGraph.createVertex(data: 6)
        let v7 = simpleGraph.createVertex(data: 7)
        simpleGraph.createEdges(from: v0, to: v3)
        simpleGraph.createEdges(from: v1, to: v3)
        simpleGraph.createEdges(from: v2, to: v4)
        simpleGraph.createEdges(from: v2, to: v3)
        simpleGraph.createEdges(from: v5, to: v6)
        simpleGraph.createEdges(from: v5, to: v7)
        simpleGraph.createEdges(from: v6, to: v7)
        simpleGraph.createEdges(from: v7, to: v5)
        XCTAssertFalse(simpleGraph.isBipartite())
    }
}
