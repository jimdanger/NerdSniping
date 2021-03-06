//
//  LoveLetterChecker.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/27/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


/*
 
 You have written an anonymous love letter and you don’t want your handwriting to be recognized. 
 Since you don’t have a printer within reach, you are trying to write this letter by copying and pasting characters from a newspaper.
 
 Given a string L representing the letter and a string N representing the newspaper, return true if the L can be written entirely from N and false otherwise. The letter includes only ascii characters.
 
*/

//import Foundation

class LoveLetterChecker {
    
    // Using loops. Running time: O(n^2)  -> Technically, this is O(l*n), where l = letter.characters.count and n = newspaper.characters.count
    public func canBeWrittenEntirelyFrom(letter: String, newspaper: String) -> Bool {
        var loveLetter = letter
        
        for newschar in newspaper.characters {
            
            for (i, letterchar) in loveLetter.characters.enumerated() {
                if newschar == letterchar {
                    
                    let stringIndex = loveLetter.characters.index(loveLetter.startIndex, offsetBy: i)
                    loveLetter.characters.remove(at: stringIndex)
                    
                }
                if loveLetter.characters.count == 0  {
                    return true 
                }
            }
        }
        return false 
    }
    
    // Another implementation, using a hashTable.  Running time: O(n)  -> Technically, O(l+n)
    public func canBeWrittenEntirelyFrom2(letter: String, newspaper: String) -> Bool {
        let kNumberOfAsciiChars = 128
        var hashArray: [Int] = []
        
        for _ in 0..<kNumberOfAsciiChars {
            hashArray.append(0)
        }
        
        for nChar in newspaper.characters {
            let value = nChar.asciiKeyValue()
            hashArray[value] += 1
        }
        
        
        for lChar in letter.characters {
            let value = lChar.asciiKeyValue()
            if   hashArray[value] == 0 {
                return false
            } else {
                hashArray[value] -= 1
            }
        }
        return true
    }
}

extension Character {
    func asciiKeyValue() -> Int {
        return Int((String(self).unicodeScalars.filter{$0.isASCII}.first?.value)!)
    }
}









