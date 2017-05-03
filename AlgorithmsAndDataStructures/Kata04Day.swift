//
//  Kata04Day.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 5/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//



class Kata04Day {
    
    var day: Int
    var maxTemp: Kata04Temp
    var minTemp: Kata04Temp
    
    init(day: Int, maxTemp: String, minTemp: String) {

        func makeTemp(fromString: String) -> Kata04Temp {
            guard let temp: Int = Int(stringWithAsteriskScrubbed(string: fromString)) else {
                return Kata04Temp(temp: 0, isMonthRecord: false) // TODO: this should throw a real error...
            }
            return Kata04Temp(temp: temp, isMonthRecord: doesStringHaveAsterisk(string: fromString))
        }
        
        func doesStringHaveAsterisk(string: String ) -> Bool {
            
            for character in string.characters {
                if character == "*" {
                    return true
                }
            }
            return false
        }
        
        
        func stringWithAsteriskScrubbed(string: String) -> String {
            return string.replacingOccurrences(of: "*", with: "")
        }
        
    
        self.day = day
        self.maxTemp = makeTemp(fromString: maxTemp)
        self.minTemp = makeTemp(fromString: minTemp)
        
        
        
    }
    
   
}
