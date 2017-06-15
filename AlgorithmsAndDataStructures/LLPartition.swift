//
//  LLPartition.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/15/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


/*
 
 Crack the Coding Interview 2.4:
 
   Write code to partition linked list around a value x, such that
   nodes less than x come before all the nodes greater than or equal to x.
   If x is in the list, the values of x only need to be after the elements less
   than x. 
 
    The partition element x can appear anywhere in the 'right partition'; 
    it does not need to appear between the left and right partitions.

 Example
    3->5head.saveToLL(head: head, data: 3)->8->5->10->2-> 1 (partition = 5)
    3->1->2->10->5->5->8
 
 */


class LLPartition { // not conforming to LinkedList b/c that expects string type. Also for practice
    
    var data: Int?
    var next: LLPartition?
    
    init (data: Int) {
        self.data = data
    }
    
    func partition(head: LLPartition, point: Int) -> LLPartition? {
        
    // whiteboard:
        // do this in a way inspired by mergesort. 
        // loop through it, appending to a new LL if > and another New LL if <
        // join the two
    

        var node: LLPartition?  = head
        var lefthead: LLPartition?
        var righthead: LLPartition?
        while node != nil {
            if (node?.data)! < point {
                if lefthead == nil {
                    lefthead = LLPartition(data: (node?.data)!)
                } else {
                    saveToLL(head: lefthead!, data: (node?.data)!)
                }
            } else {
                if righthead == nil {
                    righthead = LLPartition(data: (node?.data)!)
                } else {
                    saveToLL(head: righthead!, data: (node?.data)!)
                }
            }
            node = node?.next
        }
        
        // join them: 
        var n = lefthead
        while n?.next != nil {
            n = n?.next
        }
        n?.next = righthead
        return lefthead
    }
    
    func saveToLL(head: LLPartition, data: Int) {
        var node: LLPartition? = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = LLPartition (data: data)
    }
    
}
