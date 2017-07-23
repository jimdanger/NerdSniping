//
//  CheckBalanced .swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/16/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

/**
 
 * Crack the Coding Interview 4.4:
 * Implement a function to check if a binary tree is balanced.
 * For the purposes of this question, a balanced tree is defined
 * to be a tree such that the heights of the two subtrees of any
 * node never differ by more than one.
 */


import Foundation

class CBNode {
    var data: Int
    var left: CBNode?
    var right: CBNode?
    
    init(data: Int){
        self.data = data
    }
}

class CheckBalanced {
    
    func isBalanced(root: CBNode) -> Bool {
        if root.left == nil && root.right == nil {
            return true
        }
       
        var leftHeight = 1
        if root.left == nil {
            leftHeight = 0
        } else {
            leftHeight += height(node: root.left!)
        }
        
        var rightHeight = 1
        if root.right == nil {
            rightHeight = 0
        } else {
            rightHeight += height(node: root.right!)
        }        
        return abs(rightHeight - leftHeight) <= 1
        
    }
    
    func height(node: CBNode) -> Int {
        
        if node.left == nil && node.right == nil {
            return 0
        }
        
        var leftHeight = 0
        if node.left != nil{
            leftHeight = height(node: node.left!) + 1
        }
        var rightHeight = 0
        if node.right != nil{
            rightHeight = height(node: node.right!) + 1
        }
        return leftHeight >= rightHeight ? leftHeight : rightHeight
    }
}

