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
 
    Example :
 
    input:  'Tact Coa'
 
    output: True (permutations: 'taco cat', 'atco cta', etc.)
 
 */


class PalindromePermutationChecker {

    func isPalindrome(s1: String, s2: String) -> Bool {
        
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
    
    func isPermutationOfPalindrome(string: String) -> Bool {

        // should return true if:
        // - if .count is even, each character appears an even # of times
        // - if .count is odd, each c, except 1 appears even number of times
        // note, it looks like the example is ignoring spaces.
        
        let noSpacesString = removeSpaces(string: string)
        
        let instanceCounter = StringPermutationChecker()
        
        var instancesOfCharacter = 0
        var numberOfUniqueOddInstances = 0
        var uniqueOddInstances: [Character] = []
        
        for character in noSpacesString.characters {
            instancesOfCharacter = instanceCounter.numberOfInstances(character: character, string: noSpacesString)
            
            if isEven(number: noSpacesString.characters.count) {

                if isEven(number: instancesOfCharacter) {
                    // do nothing, so far this looks like we should return true.
                } else {
                    return false
                }
                
            } else {
                if !isEven(number: instancesOfCharacter) {
                    
                    if instancesOfCharacter % 2 == 1 {
                        numberOfUniqueOddInstances += 1
                       
                        if !uniqueOddInstances.contains(character) {
                            
                            uniqueOddInstances.append(character)
                           
                            if uniqueOddInstances.count > 1 {
                                print(uniqueOddInstances.count)
                                return false
                            }
                        }
                    }
                }
            }
        }
       
        
        return true
        
    }
    
    func isEven(number: Int) -> Bool {
        return number % 2 == 0
    }
    
    func removeSpaces(string: String) -> String {
        let charArrayNoSpaces = string.characters.filter { (c) -> Bool in
            return c == " " ? false : true
        }
        
        var noSpaceString = ""
        for character in charArrayNoSpaces {
            noSpaceString.append(character)
        }
        return noSpaceString
        
    }
    
}
