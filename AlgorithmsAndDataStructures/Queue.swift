//
//  File.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

class Queue {
    typealias T = String
    
    var head: QueueNode?
    
    func add(data: T) {
        let node = QueueNode(data: data)
        if isEmpty() {
            head = node
        } else {
            var nodeInFocus = head
            while nodeInFocus?.next != nil {
                nodeInFocus = nodeInFocus?.next
            }
            nodeInFocus?.next = node
        }
    }
    
    func remove() {
        if !isEmpty() {
           head = head?.next
        }
    }
    
    func peak() -> T? {
        return head?.data
    }
    
    func isEmpty() -> Bool {
        return head == nil ? true : false
    }
}
