//
//  SortStack.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/21/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


/*

 Crack the Coding Interview 3.5:

 Sort Stack: Write a program to sort a stack such that the smallest items are on the top. 
 You can use an additional temporary stack, but you may not copy the elemtns into any 
 other data structure (such as an array). The stack supports the following operations: 
 push, pop, peek, and isEmpty.
 

*/

class SortStack {
    
    typealias T = SortStackNode.T
    var topNode: SortStackNode?
    var tempStackTopNode: SortStackNode?
    
    func push(item: SortStackNode) {
        let node = SortStackNode(data: item.data)
        
        if self.isEmpty() {
            topNode = node
            returnTempStackToStack()
        } else {
            if node.data <= (topNode?.data)! {
                node.next = topNode
                topNode = node
                returnTempStackToStack()
            } else {
                
                moveTopNodeToTempStack()
                push(item: node)
            }
        }
    }
    
    private func moveTopNodeToTempStack() {
        if tempStackTopNode == nil {
            tempStackTopNode = SortStackNode(data:(topNode?.data)!)
            pop()
        } else {
            tempStackTopNode?.next = SortStackNode(data:(tempStackTopNode?.data)!)
            tempStackTopNode?.data = (topNode?.data)!
            pop()
        }
    }
    
    private func returnTempStackToStack () {
        while tempStackTopNode != nil {
            let thingToPush: SortStackNode = tempStackTopNode!
            tempStackTopNode = tempStackTopNode?.next
            push(item: thingToPush)
        }
    }
    
    func pop() {
        if let unwrappedTopNode = topNode {
            self.topNode = unwrappedTopNode.next
        } else {
            // real application might throw error here.
        }
    }
    func peek() -> SortStackNode? {
        return topNode
    }
    func isEmpty() -> Bool {
        return topNode == nil
    }
}

class SortStackNode {
    typealias T = Int
    var next: SortStackNode?
    var data: T
    init (data: T) {
        self.data = data
    }
}
