//
//  URLifyer.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/9/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//



/*
    Crack the Coding Interview 1.3:
    
    URLify: Write a method ro replace all spaces in a string with '%20'. 
 
 */

class URLifyer {

    func urlify(string: String) -> String {
        
        let modifiedStringCharacterArray = string.characters.map { (c) -> String in
            if c == " " {
                return "%20"
            } else {
                return String(c)
            }
        }

        return modifiedStringCharacterArray.joined(separator: "")
    }
}
    
