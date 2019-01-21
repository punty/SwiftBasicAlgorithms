
import XCTest

class ConnectedComponentTests: XCTestCase {
    lazy var graph: UndirectedGraph<Int> = {
        return UndirectedGraph<Int>.create(from: TestData.connectedComponent)
    }()
    
    func testConnectedComponent() {
        XCTAssertEqual(graph.connectedComponents(), [0,0,0,0,1,1])
    }

}
