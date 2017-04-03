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
    
    func breadthFirstSearch(start: BstNode, target: Int) -> BstNode? {
        
        
        
        return nil
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
    
    func getRootValue() -> Int? {
        return root?.value
    }
    
}
