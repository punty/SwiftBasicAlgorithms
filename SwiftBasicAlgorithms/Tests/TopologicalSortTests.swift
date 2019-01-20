
import XCTest

class TopologicalSortTests: XCTestCase {
    func testPost() {
        let g = Digraph<Int>.create(from: TestData.topologicalSort)
        let topologicalSort = g.topologicalSort()
        XCTAssertTrue(topologicalSort == [0,1,2,3,4] ||
            topologicalSort == [0,1,2,4,3])
    }
}
