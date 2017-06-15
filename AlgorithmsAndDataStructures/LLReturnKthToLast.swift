//
//  LLReturnKthToLast.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/14/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

//import Foundation

/*
 Crack the Coding Interview 2.2:
 
    Return Kth To Last:
 
    Implement an algorithm fo find the kth to last element of a singly linked list.
 
 
 */


class LLReturnKthToLast: LinkedList {
    
    func getKthToLast(k: Int) -> LinkedListNode? {
        
        /* Whiteboard:
            - iterate through once to count, and again to find Kth to last. O(N^2)
        
            - iterate a few times, once with a runner that skips a 1000 or so,
            then again skipping 1000/2, etc. that way we could find the last one 
            a lot quicker
                - how does this even work? I guess I just loop 1000 times always advanceing to the next node without actually performaing a computation on the node
                - so for this problem (where there is no computation on the node anyway), i don't quite see how this saves computational time. It may even add time.
                -  is node.next.next the same computational speed as doing node.next twice?
         
            - Can we do better?
         
            - hmmm...
         
            - As I advance through the LL, I could keep track of the node that is k behind the current position. Then, when we get to the end, we can instantly return that node.
                - This one is the winner. this is O(N), might be hard to do better.
         
        
        */
        
        
        var thisNode = headNode
        var kthBehind: LinkedListNode? = nil
        var i = 0
        var thisNodeIsKAheadOfHead = false
        while thisNode != nil {
            
            if thisNodeIsKAheadOfHead {
                kthBehind = kthBehind?.nextNode
            }
            
            if i == k {
                thisNodeIsKAheadOfHead = true
                kthBehind = headNode
            }
            
            i += 1
            thisNode = thisNode?.nextNode

        }
        return kthBehind

    }
    
    
}
