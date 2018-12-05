import Foundation

final class LinkedList<T> {
    let value: T
    var next: LinkedList<T>?
    init (_ value: T) {
        self.value = value
    }
}

struct Queue<T> {
    var head: LinkedList<T>?
    var tail: LinkedList<T>?
    
    mutating func enqueue(x :T) {
        let node = LinkedList(x)
        guard self.tail != nil else {
            self.tail = node
            self.head = node
            return
        }
        self.tail?.next = node
        self.tail = node
    }
    
    mutating func dequeue() -> T? {
        guard let head = head else { return nil }
        let h = head
        self.head = head.next
        if head.next == nil {
            self.tail = nil
        }
        return h.value
    }
    
}
