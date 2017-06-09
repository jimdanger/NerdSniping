//
//  StringPermutationChecker.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/8/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//



/*
    Crack the Coding Interview 1.2:
        Given two strings write a method to decide if one is a permutation of the other
 */

class StringPermutationChecker {
   
    
    func isPermutation(string1: String, string2: String, bySorting: Bool = true ) -> Bool {
        
        if bySorting {
            return determingBySorting(string1: string1, string2: string2)
        } else {
            return determingByIterating(string1: string1, string2: string2)
        }
    }
    
    
    private func determingBySorting(string1: String, string2: String) -> Bool {

        if string1.characters.count != string2.characters.count {
            return false
        }
        
        let s1Sorted = string1.characters.sorted()
        let s2Sorted = string2.characters.sorted()
        
        return s1Sorted.elementsEqual(s2Sorted)
    }
    
    private func determingByIterating(string1: String, string2: String) -> Bool {
        if string1.characters.count != string2.characters.count {
            return false
        }
        
        for character in string1.characters {
            
            if !string2.contains(String(character)) {
                return false
            }
            
            let instancesInString1: Int = numberOfInstances(character:character, string: string1)
            let instancesInString2: Int = numberOfInstances(character: character, string: string2)
            
            if instancesInString1 != instancesInString2 {
                return false
            }
        }
        return true
    
    }

    private func numberOfInstances(character: Character, string: String) -> Int {
        
        var count = 0
        
        for char in string.characters {
            if char == character {
                count += 1
            }
        }
        return count
    }
    
}

