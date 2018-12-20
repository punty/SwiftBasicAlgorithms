
import XCTest

class BipartiteGraphTests: XCTestCase {
    
    func testBipartiteFails() {
        var simpleGraph = UndirectedGraph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        simpleGraph.createEdge(from: v0, to: v3)
        simpleGraph.createEdge(from: v1, to: v3)
        simpleGraph.createEdge(from: v2, to: v4)
        simpleGraph.createEdge(from: v3, to: v3)
        simpleGraph.createEdge(from: v2, to: v3)
        XCTAssertFalse(simpleGraph.isBipartite())
    }

    func testBipartite() {
        var simpleGraph = UndirectedGraph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        simpleGraph.createEdge(from: v0, to: v3)
        simpleGraph.createEdge(from: v1, to: v3)
        simpleGraph.createEdge(from: v2, to: v4)
        simpleGraph.createEdge(from: v2, to: v3)
        XCTAssertTrue(simpleGraph.isBipartite())
    }
    
    func testEmptyGraph() {
        let simpleGraph = UndirectedGraph<Int>()
        XCTAssertTrue(simpleGraph.isBipartite())
    }
    
    func testNotStronglyConnectedGraph() {
        var simpleGraph = UndirectedGraph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        let v5 = simpleGraph.createVertex(data: 5)
        let v6 = simpleGraph.createVertex(data: 6)
        simpleGraph.createEdge(from: v0, to: v3)
        simpleGraph.createEdge(from: v1, to: v3)
        simpleGraph.createEdge(from: v2, to: v4)
        simpleGraph.createEdge(from: v2, to: v3)
        simpleGraph.createEdge(from: v5, to: v6)
        XCTAssertTrue(simpleGraph.isBipartite())
    }

    func testNotStronglyConnectedGraphNotBipartite() {
        var simpleGraph = UndirectedGraph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        let v5 = simpleGraph.createVertex(data: 5)
        let v6 = simpleGraph.createVertex(data: 6)
        let v7 = simpleGraph.createVertex(data: 7)
        simpleGraph.createEdge(from: v0, to: v3)
        simpleGraph.createEdge(from: v1, to: v3)
        simpleGraph.createEdge(from: v2, to: v4)
        simpleGraph.createEdge(from: v2, to: v3)
        simpleGraph.createEdge(from: v5, to: v6)
        simpleGraph.createEdge(from: v5, to: v7)
        simpleGraph.createEdge(from: v6, to: v7)
        simpleGraph.createEdge(from: v7, to: v5)
        XCTAssertFalse(simpleGraph.isBipartite())
    }
}
