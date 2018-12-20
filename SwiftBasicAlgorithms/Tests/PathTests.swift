
import XCTest

class PathTests: XCTestCase {

    lazy var graph: UndirectedGraph<Int> = {
        var simpleGraph = UndirectedGraph<Int>()
        let v0 = simpleGraph.createVertex(data: 0)
        let v1 = simpleGraph.createVertex(data: 1)
        let v2 = simpleGraph.createVertex(data: 2)
        let v3 = simpleGraph.createVertex(data: 3)
        let v4 = simpleGraph.createVertex(data: 4)
        simpleGraph.createEdge(from: v0, to: v1)
        simpleGraph.createEdge(from: v0, to: v2)
        simpleGraph.createEdge(from: v2, to: v1)
        simpleGraph.createEdge(from: v0, to: v3)
        simpleGraph.createEdge(from: v1, to: v4)
        return simpleGraph
    }()
    
    func testPath() {
        let p = Path(graph: graph, start: graph[0].vertex)
        let pa = p.path(to: graph[4].vertex)
        XCTAssertEqual(pa.map {$0.index}, [4,1])
    }

}
