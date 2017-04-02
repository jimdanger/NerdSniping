//
//  LinkedListNode.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

class LinkedListNode {
    typealias T = String 

    var data: T?
    var nextNode: LinkedListNode?
    
    init (data: T) {
        self.data = data
    }
    
    func getNext() -> LinkedListNode? {
        return self.nextNode
    }
}
