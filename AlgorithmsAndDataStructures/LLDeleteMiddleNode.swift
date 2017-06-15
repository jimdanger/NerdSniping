//
//  LLDeleteMiddleNode.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/15/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

//import Foundation

/*
 Crack the Coding Interview 2.3:
 
    Delete Middle Node:
 
    Implement an algorithm to delete a node in the middle (i.e any node but the first and last node, not necesarily the exact middle) of a singly linked list, give only access to that node.
 
    EXAMPLE:
        input: the node c from the linked list a-b-c-d-e-f
        result: norhting is returned, but the new linked list looksl ike a-b-d-e-f

 
 */


class LLDeleteMiddleNode: LLReturnKthToLast { // LLReturnKthToLast for testing
    
    // warning: per the instructions, this function assumes n != first || last.
    func deleteMiddleNode(node: LinkedListNode) {
        
        var n = headNode
        var previousNode: LinkedListNode?
        while n != nil {
            
            if n!.data == node.data { // this is a proxy for a true node == node comparison. in real world makde nodes conform to equatable use UUIDs or something.
                
                previousNode?.nextNode = n?.nextNode
                
            }
            previousNode = n
            n = n?.nextNode
            
        }
    }
    
    
    
}
