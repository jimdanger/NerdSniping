//
//  Stack.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


class Stack {
    typealias T = String
    
    var head: StackNode? // sometimes called "top"
    
    func pop() {
        if isEmpty() {
            return
        } else {
            head = head?.next
        }
    }
    
    func push (data: T) {
        let node = StackNode(data: data)
        node.next = head
        head = node
    }
    
    
    func peak () -> T? {
        return head?.data
    }
    
    
    func isEmpty () -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    
    
}
