
import XCTest

class FindDirectedCycleTests: XCTestCase {
    func testDagHasNoCycle() {
        let g = Digraph<Int>.create(from: TestData.DAG)
        XCTAssertTrue(g.findDirectedCycle().isEmpty)
    }
    
    func testGraphHasCycle() {
        let g = Digraph<Int>.create(from: TestData.directGraph)
        XCTAssertFalse(g.findDirectedCycle().isEmpty)
    }
}
