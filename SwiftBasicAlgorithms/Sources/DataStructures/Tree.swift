
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
        node.parent = self
        self.children.append(node)
    }
    
    func append(nodes: [TreeNode<T>]) {
        nodes.forEach { node in
            node.parent = self
        }
        self.children.append(contentsOf: nodes)
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
