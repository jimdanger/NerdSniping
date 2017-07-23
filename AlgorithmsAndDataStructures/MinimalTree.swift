//
//  MinimalTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/13/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import Foundation

/*
 
 Crack the Coding Interview 4.2:
 
 Minimal Tree: given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.
 
 */

class MinTreeNode {
    var data: Int
    var left: MinTreeNode?
    var right: MinTreeNode?
    init (data: Int ){
        self.data  = data
    }
}

class MinimalTree {
    
    var root: MinTreeNode?
    
    init(array: [Int]) {
        self.root = create(array: array)
    }
    
    func create(array: [Int]) -> MinTreeNode? {
        if array.isEmpty {
            return nil
        }
        
        if array.count == 1 {
            return MinTreeNode(data: array[0])
        }
        
        let middleIndex = findMiddleIndex(array: array)
        let result = MinTreeNode(data: array[middleIndex])
        
        let leftArray = Array(array[0..<middleIndex])
        let rightArray = Array(array[middleIndex..<array.count])
        
        result.left = create(array: leftArray)
        result.right = create(array: rightArray)
        
        return result
    }
    
    func findMiddleIndex(array: [Int]) -> Int {
        return  array.count/2
    } 
}
