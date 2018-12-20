
import Foundation

struct EdgeList<T> {
    let vertex: Vertex<T>
    var edges: Set<Int> = []
    init (vertex: Vertex<T>) {
        self.vertex = vertex
    }
}

struct Vertex<T> {
    var data: T
    var index: Int
}
