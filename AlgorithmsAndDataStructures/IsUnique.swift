//
//  IsUnique.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/8/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

/* 
    Crack the Coding Interview 1.1:
        Implement an algorithm to determine if a string has all unique characters.
        What if you cannot use additional data structures?
 */

import Foundation

class ArraysAndStringsIsUnique {
    
    func isUnique(string: String) -> Bool {
        
        guard let firstChar = string.characters.first else {
            return true // emtpy string has no duplicates
        }
        
        var charInFocus: Character = firstChar
        
        for character in string.characters {
            
            charInFocus = character
            var timesCharAppears = 0
        
            for character in string.characters {
                if character == charInFocus {
                    timesCharAppears = timesCharAppears + 1
                    if timesCharAppears > 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }
    
}
