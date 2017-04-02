//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

public class LinkedList {
    typealias T = String
    
    var headNode: LinkedListNode?
    
    
    func save(data: T) {
        addNodeAsNewHead(node: LinkedListNode(data: data))
    }
    
    func get(data: T) -> LinkedListNode? {
        return findNode(data: data)
    }
    
    func remove(data: T) {
        if headNode?.data == data {
            let _ = popHead()
            return
        }
        var nodeInFocus = headNode
        while nodeInFocus?.nextNode != nil {
            if nodeInFocus?.nextNode?.data == data {
                nodeInFocus?.nextNode = nodeInFocus?.nextNode?.nextNode
            }
            nodeInFocus = nodeInFocus?.nextNode
        }
    }
    
    func popHead() -> T? {
        
        let data = headNode?.data
        if let next = headNode?.getNext() {
            headNode = next
        } else {
            headNode = nil 
        }
        return data
    }
    
    private func addNodeAsNewHead(node: LinkedListNode) {
        node.nextNode = headNode
        self.headNode = node
    }
    
    func findNode(data: T) -> LinkedListNode? {
        
        var nodeInFocus = headNode
        while nodeInFocus != nil {
            if nodeInFocus?.data == data {
                return nodeInFocus
            }
            nodeInFocus = nodeInFocus?.getNext()
        }
        return nil
    }
}
