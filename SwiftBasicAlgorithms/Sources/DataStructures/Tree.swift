
import Foundation

class TreeNode<T: Comparable> {
    var value: T
    var parent:TreeNode<T>?
    var children: [TreeNode<T>] = []
    init(value: T) {
        self.value = value
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var height: Int {
        guard let maxHeight = children.map({ $0.height }).max() else {
            return 1
        }
        return 1+maxHeight
    }
    
    func append(node: TreeNode<T>) {
        self.children.append(node)
        node.parent = self
    }
    
    func append(nodes: [TreeNode<T>]) {
        self.children.append(contentsOf: nodes)
        nodes.forEach { node in
            node.parent = self
        }
    }
}

class BinaryNode<T: Comparable> {
    var value: T
    var leftChild: BinaryNode<T>?
    var rightChild: BinaryNode<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func height() -> Int {
        let lheight = leftChild?.height() ?? 0
        let rheight = rightChild?.height() ?? 0
        return 1 + max(lheight, rheight)
    }
    
    func isBalanced() -> Bool {
        let lh = leftChild?.height() ?? 0
        let rh = rightChild?.height() ?? 0
        let lb = leftChild?.isBalanced() ?? true
        let rb = rightChild?.isBalanced() ?? true
        return (abs(lh-rh) <= 1) && lb && rb
    }
}
