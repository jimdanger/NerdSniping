//
//  ListOfDepths.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/15/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

/*
 
 Crack the Coding Interview 4.3:
 
 List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth.
 (e.g., if you hvae a tree with depth D, you'll hae D linked lists.)
 
 */

import Foundation

class DepthLLTreeNode {
    
    var data: Int?
    var left: DepthLLTreeNode?
    var right: DepthLLTreeNode?
}


class DepthLLTree  {
    var head: DepthLLTreeNode?
}

class DepthLLNode: DepthLLTreeNode {
    var next: DepthLLNode?
    var level: Int
    
    init(treeNode: DepthLLTreeNode, level: Int) {
        self.level = level
        super.init()
        self.data = treeNode.data
        self.left = treeNode.left
        self.right = treeNode.right
    }
}


class ListOfDepthsFactory {
    
    var queue =  DepthLLQueue()
    var result: [Int:DepthLLNode] = [ : ]
    
    func listOfDepths(tree: DepthLLTree) -> [Int:DepthLLNode] {
        
        
        let nodeInFocus: DepthLLNode =  DepthLLNode(treeNode: tree.head!, level: 0)
        
        queue.add(node: nodeInFocus)
        
        while !queue.isEmpty() {
            
            processFirstNode(node: queue.peakAndPop()!)
            
            if  nodeInFocus.left != nil {
                let left: DepthLLNode = DepthLLNode(treeNode: nodeInFocus.left!, level: nodeInFocus.level + 1)
                queue.add(node: left)
            }
            
            if  nodeInFocus.right != nil {
                let right: DepthLLNode = DepthLLNode(treeNode: nodeInFocus.right!, level: nodeInFocus.level + 1)
                queue.add(node: right)
            }
        }
        return result
    }
    
    
    func processFirstNode(node: DepthLLNode){
        
        
        if let head = result[node.level] {
            node.next = head
        }
        result[node.level] = node
    }
}

class DepthLLQueue {
    var first: DepthLLNode?
    var last: DepthLLNode?
    
    func add(node: DepthLLNode)  {
        if first == nil {
            first = node 
        }
        if last == nil {
            last = node 
        } else {
            last?.next = node 
            last = node 
        }
    }
    
    func peakAndPop() -> DepthLLNode? {
        let nodeToReturn = self.first 
        self.first = first?.next 
        return nodeToReturn
    }
    
    func isEmpty() -> Bool {
        return first != nil
    }
}





