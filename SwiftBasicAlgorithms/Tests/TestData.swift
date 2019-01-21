
import Foundation
/**
 Struct containing test data.
 The first line contains the number of vertexes in the graph
 The other couple of numbers contains the edges (in case of undirected graph two edges from and to are created)
 */
struct TestData {
    static let connectedComponent = """
    6
    0 1
    1 3
    3 2
    0 2
    4 5
    """
    static let simpleTopologicalSort = """
    5
    0 1
    0 2
    1 2
    1 3
    2 3
    2 4
    """
    static let DAG = """
    13
    2 3
    0 6
    0 1
    2 0
    11 12
    9 12
    9 10
    9 11
    3 5
    8 7
    5 4
    0 5
    6 4
    6 9
    7 6
    """
    static let simpleDAG = """
    3
    0 1
    1 2
    2 0
    """
    static let directGraph = """
    13
    4 2
    2 3
    3 2
    6 0
    0 1
    2 0
    11 12
    12 9
    9 10
    9 11
    8 9
    10 12
    11 4
    4 3
    3 5
    7 8
    8 7
    5 4
    0 5
    6 4
    6 9
    7 6
    """
}
