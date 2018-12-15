
import Foundation

struct Stack<T> {
    private var storage = [T]()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    var top: T? {
        return storage.last
    }
    mutating func push(_ element: T) {
        storage.append(element)
    }
    mutating func pop() -> T? {
        return storage.popLast()
    }
}
