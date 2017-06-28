//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

class BinarySearchTree {
    /* 
        Binary search tree is a binary tree in which every node fits a specific ordering property:
           [all left descendants] <= n < [all right descendants]
    */
    
    class BstNode {
        var value: Int
        var left: BstNode?
        var right: BstNode?
        
        init (value: Int) {
            self.value = value
        }
    }
    
    var root: BstNode?
    
    func getRootValue() -> Int? {
        return root?.value
    }

    
    func asdf () {
        let numoflines = 5
        
        for _ in 1...numoflines {
          _ = readLine()!.characters.split(separator: " ").map{ Int(String($0))! }
        }
    }
    
//    for i in 1...numoflines {
//
//    }
    
    
    
    
    // MARK:- Put
    func put (value: Int) {
        let newNode = BstNode(value: value)
        guard let unwrappedRoot = root else {
            root = newNode
            return
        }
        putHelper(nodetoAdd: newNode, parent: unwrappedRoot)
    }
    
    private func putHelper(nodetoAdd: BstNode, parent: BstNode) {
        
        if nodetoAdd.value <= parent.value {
            if parent.left == nil {
                parent.left = nodetoAdd
            } else {
                putHelper(nodetoAdd: nodetoAdd, parent: parent.left!)
            }
        } else {
            
            if parent.right == nil {
                parent.right = nodetoAdd
            } else {
                putHelper(nodetoAdd: nodetoAdd, parent: parent.right!)
            }
        }
    }
    

    // MARK:- Searches
    func breadthFirstSearch(start: BstNode, target: Int) -> BstNode? {
        
        let queue = BreadthFirstSearchQueue()
        queue.add(data: start)
        
        while !queue.isEmpty() {
            let nextNode = queue.peakAndRemove()
            if nextNode?.value == target {
                return nextNode
            } else {
                if let leftChild = nextNode?.left {
                    queue.add(data: leftChild)
                }
                if let rightChild = nextNode?.right {
                    queue.add(data: rightChild)
                }
            }
        }
        return nil
    }
    
    // Ideally one could reuse Queue.swift. Here, I wanted to practice coding this out.
    
    public class BreadthFirstSearchQueue { // this could be private, but I wanted to test it easily.
        
        private class BFSQueueNode {
            var data: BstNode
            var next: BFSQueueNode?
            init (data: BstNode) {
                self.data = data
            }
        }
        
        private var head: BFSQueueNode?
        func add(data: BstNode) {
            let nodeToAdd = BFSQueueNode(data: data)
            
            if head == nil {
                head = nodeToAdd
            } else {
                var nodeInFocus = head
                while nodeInFocus?.next != nil {
                    nodeInFocus = nodeInFocus?.next
                }
                nodeInFocus?.next = nodeToAdd
            }
            
        }
        
        func peakAndRemove() -> BstNode? {
            let nodeToReturn = head
            head = nodeToReturn?.next
            return nodeToReturn?.data
        }
        
        func isEmpty() -> Bool {
            if head == nil {
                return true
            } else{
                return false
            }
        }
    }
    
    
    
    func depthFirstSearch(start: BstNode, target: Int) -> BstNode? {

        if start.value == target {
            return start
        }
        
        if target < start.value {
            if let leftChild = start.left {
                return depthFirstSearch(start: leftChild, target: target)
            }
        } else {
            if let rightChild = start.right {
                return depthFirstSearch(start: rightChild, target: target)
            }
        }
        return nil
    }
    
    // MARK:- Traverses
        // ...
    
    
    

    
}
