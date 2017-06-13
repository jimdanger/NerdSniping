//
//  StringCompresser.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/12/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


/*
 Crack the Coding Interview 1.6:
 
 String Compression:
 
 Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2b1c5a3. If the compressed string would not become smaller than the original string, your method should return the original string.
 
 You can asusme the string has only uppercase and owecase letters (a-z). (For simplicity, I am only going to deal with lowercase.)
 
 */


class StringCompresser {
    
    func compress(s: String) -> String {
        let string = s.lowercased()
        
        guard string.isCompressable() else {
            return string
        }
        
        var compressed: String = ""
        var number: Int = 1

        var lastChar: Character = "."
        
        for i in 0..<string.characters.count {
            
            if  string[i] == lastChar {
                
                number += 1
                compressed = compressed.appendNumberOrReplaceLastNumberWith(x: number)
                
            } else {
                compressed.append(string[i])
                lastChar = string[i]
                number = 1
            }
        }
        
        return compressed
    }
}


extension String {
    
    func isCompressable() -> Bool {
        
        guard !self.isEmpty else {
            return false
        }
        
        for i in 0..<characters.count {
            if i + 2 < characters.count {
                let thisChar: Character = self[i]
                let nextChar: Character = self[(i+1)]
                let nextNextChar: Character = self[(i+2)]
                if thisChar == nextChar && thisChar == nextNextChar {
                    return true
                }
            }
        }
        return false
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    mutating func appendNumberOrReplaceLastNumberWith(x: Int) -> String {
        
        let oneLess = x - 1
        
        if let last: Character = self.characters.last {
            if last == Character("\(oneLess)") {
                
            self = self.substring(to: self.index(before: self.endIndex))
        
            }
            self.append("\(x)")
            
        }
        
        return self
    }
}
