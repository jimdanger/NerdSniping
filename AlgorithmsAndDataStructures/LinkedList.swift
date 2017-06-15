//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

public class LinkedList: Equatable {
    typealias T = LinkedListNode.T
    
    var headNode: LinkedListNode?
    
    
    func save(data: T) {
        addNodeAtEnd(node: LinkedListNode(data: data))
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
    
    private func addNodeAtEnd(node: LinkedListNode) {
        
        if headNode == nil {
            headNode = node
            return
        }
        var nodeInFocus = headNode
        while nodeInFocus?.nextNode != nil{
            nodeInFocus = nodeInFocus?.nextNode
        }
        nodeInFocus?.nextNode = node
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
    
    public static func ==(lhs: LinkedList, rhs: LinkedList) -> Bool {
   
        let l = lhs.getString()
        let r = rhs.getString()
        
        return l == r
    }
    
    func getString() -> String {
        var string = ""
        var node = headNode
        while node != nil {
            if let s = node?.data {
                string.append(s)
            }
            node = node?.nextNode
        }
        return string
        
    }
    
}
