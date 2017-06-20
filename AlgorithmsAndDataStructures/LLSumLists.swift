//
//  LLSumLists.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/16/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

//import Foundation


/*
    CTCI 2.5 Sum lists
 
    You have two numbers represented by linked list, where each node contains
    a single digit. Digits are stored in reverse order.(1's digit is at the head)
    Write a function that adds two such numbers and returns a number in similar
    list format.
 
    Example:
 
    7-->1-->6 + 5-->9-->2 = 2-->1-->9   which is (617 + 295  = 912)
    
    What if digits are not stored in reverse order (i.e 1's digit is at tail)
 
    (6--1-->7) + (2-->9-->5) = (9-->1-->2)
 
 */


class LLSumLists {
    
    var data: Int
    var next: LLSumLists?
    
    init(data: Int) {
        self.data = data
    }
    
    func sum(x: LLSumLists, y: LLSumLists, onesDigitAtHead: Bool = true) -> LLSumLists? {
        
        // whiteboard: 
            // iterate, and for each node, add them togetther, and remember the carry. 
            // repeat until you both nodes are done.
        
        var node1: LLSumLists? = x
        var node2:LLSumLists? = y
        var resultHead: LLSumLists?
        var carry: Int?
        var placeDivider: Int = 10
        var resultNodeInFocus: LLSumLists?
        while (node1 != nil && node2 != nil) {
            
            let d1:Int = node1?.data ?? 0
            let d2:Int = node2?.data ?? 0
            let c:Int = carry ?? 0
            let rawsum = d1 + d2 + c
            let digit = rawsum % 10
            
            carry = rawsum / placeDivider
            
            if resultHead == nil {
                resultHead = LLSumLists(data: digit)
                resultNodeInFocus = resultHead
            } else {
                
                resultNodeInFocus?.next = LLSumLists(data: digit)
                resultNodeInFocus = resultNodeInFocus?.next
            }

            node1 = node1?.next
            node2 = node2?.next
        }
        if let unwrappedCarry = carry {
            if unwrappedCarry != 0 {
                resultNodeInFocus?.next = LLSumLists(data: unwrappedCarry)
            }
        }
        
        
        return resultHead
    }
    
    
}
