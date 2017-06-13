//
//  LLRemoveDupes.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/13/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import Foundation

/*
 Crack the Coding Interview 2.1:
 
    Remove Dups:
 
    White code to remove duplicates from an unsorted linked list.
 
    FOLLOW UP: How would you solve this problem if a temporary buffer is not allowed?
 */

class LLRemoveDupes: LinkedList {
    
    func removeDups () {

        var thisNode = self.headNode
        
        while thisNode?.nextNode != nil {
            
            while thisNode?.data == thisNode?.nextNode?.data {
                thisNode?.nextNode = thisNode?.nextNode?.nextNode
            }
            
            var otherNode = thisNode?.nextNode
            
            while otherNode?.nextNode != nil {
                if thisNode?.data == otherNode?.nextNode?.data {
                    otherNode?.nextNode = otherNode?.nextNode?.nextNode
                }
                otherNode = otherNode?.nextNode
            }
            thisNode = thisNode?.nextNode
        }
        
    }
    
}
