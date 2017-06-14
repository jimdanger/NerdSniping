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
 
    Write code to remove duplicates from an unsorted linked list.
 
    FOLLOW UP: How would you solve this problem if a temporary buffer is not allowed?
 */

class LLRemoveDupes: LinkedList {
    
    
    func removeDups (by: RemoveDupesMethod) {

        if by == .hashTable {
            removeDupsbyHashTable()
        } else {
            removeDupsbyIterating()
        }        
    }
    
    
    
    
    var hashTableArray = [LinkedList?](repeating: nil, count: 100)
    //  runtime: O(N)
    private func removeDupsbyHashTable(){
        
        
        saveToHashTable(data: (self.headNode?.data!)!)
        
        var thisNode = self.headNode
        var previousNode: LinkedListNode?
    
        while thisNode != nil {
            
            if isAlreadyInHashTable(data: thisNode?.data) {
                previousNode?.nextNode = thisNode?.nextNode
            } else {
                saveToHashTable(data: (thisNode?.data!)!)
                previousNode = thisNode
            }
            thisNode = thisNode?.nextNode
        }
    }
    
    func isAlreadyInHashTable(data: String?) -> Bool {
        guard let unwrappedData = data else  {
            return false
        }
        
        let h = hash(s: unwrappedData)
        if hashTableArray[h] == nil {
            return false
        } else {
            let list: LinkedList? = hashTableArray[h]
            if list == nil {
                return false
            }
            if list?.findNode(data: unwrappedData) != nil {
                return true
            }
        }
     
        return false
    }
    
    // runtime: O(N^2)
    func saveToHashTable (data: LinkedList.T) {
        let h = hash(s: data)
        if hashTableArray[h] == nil {
            let list = LinkedList()
            hashTableArray[h] = list
            list.save(data: data)
        } else {
            if let list = hashTableArray[h] {
                list.save(data: data)
            }
        }
    }
    
    
    func hash(s: String) -> Int {
        return s.characters.count % 100
    }

    
    private func removeDupsbyIterating(){
        
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

enum RemoveDupesMethod {
    case hashTable
    case iterating
}


