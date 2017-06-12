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


class ArraysAndStringsIsUnique {
    
    func isUnique(string: String, determineByIterating: Bool = false) -> Bool {
        return determineByIterating ? isUniqueByIterating(string: string) : isUniqueByHashTable(string: string)
    }
    
    // Approx runtime: N^2
    private func isUniqueByIterating(string: String) -> Bool {
    
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
    
    private func isUniqueByHashTable(string: String) -> Bool {
        
        var hashTableArray = [Character?](repeating: nil, count: 100)
        
        for character in string.lowercased().characters {

            let index = isUniqueHashTableHashing(character: character)
            
            if hashTableArray[index] != nil {
                return false
            } else {
                hashTableArray[index] = character
            }
        }
        return true
    }
    
    private func isUniqueHashTableHashing(character: Character) -> Int {
        return character.asNumber()
    }
    
}

fileprivate extension Character {
    func asNumber() -> Int {
        // this is silly. don't do this. There are actually 256 characters...
        // in the real world, use this instead: https://developer.apple.com/documentation/swift/character/2906952-unicodescalars
        switch self {
        case "a":
            return 1
        case "b":
            return 2
        case "c":
            return 3
        case "d":
            return 4
        case "e":
            return 5
        case "f":
            return 6
        case "g":
            return 7
        case "h":
            return 8
        case "i":
            return 9
        case "j":
            return 10
        case "k":
            return 11
        case "l":
            return 12
        case "m":
            return 13
        case "n":
            return 14
        case "o":
            return 15
        case "p":
            return 16
        case "q":
            return 17
        case "r":
            return 18
        case "s":
            return 19
        case "t":
            return 20
        case "u":
            return 21
        case "v":
            return 22
        case "w":
            return 23
        case "x":
            return 24
        case "y":
            return 25
        case "z":
            return 26
        case " ":
            return 27
        default:
            return 0
        }
        
    }
}
