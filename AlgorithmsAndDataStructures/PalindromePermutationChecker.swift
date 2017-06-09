//
//  PalindromePermutationChecker.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/9/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

/*
    Crack the Coding Interview 1.4:

    PalindromePermutation: 
    Given a string, write a function to check if it is a permutation of a palindrome.
    A palindrome is a word or phrase that is the same forwards and backward. 
    A permutation is a rearrangement of letters. 
    The palindrome does not need to me limited to just dictionary words.
 
 */


class PalindromePermutationChecker {

    func check(s1: String, s2: String) -> Bool {
        
        if s1.characters.count != s2.characters.count {
            return false
        }
        return s1 == reverse(string: s2)
    }
    
    private func reverse(string: String) -> String {
        
        var reversedString = ""
        for character in string.characters.reversed() {
            reversedString.append(character)
        }
        return reversedString
    }
}
