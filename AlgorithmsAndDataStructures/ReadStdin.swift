//
//  ReadStdin.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/28/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

/* 
 
Most HackerRank challenges require reading input from stdin (standard input). This is one way to do it in Swift.
 
For this example:
 
- The first line contains two space-separated integers denoting the respective values of n and d
- The second line contains  space-separated integers describing the respective elements of an array.
 
5 4
1 2 3 4 5

*/

class StdinReader {
    func read (){
        let line1 = readLine()
        let line2 = readLine()
        let line3 = readLine()
        
        let count: Int = Int(line1!)!
        print(count)
        
        let string: String = line2!
        print(string)
        
    }
    
}


import Foundation

class ReadStdin2 {
    class func read () -> (s: String, c: Int){
        let line1 = readLine()
        let line2 = readLine()
        
        let count: Int = Int(line1!)!
        print(count)
        
        let string: String = line2!
        print(string)
        for (index, char) in string.characters.enumerated() {
            print(index)
            print(char)
        }
        return (string, count)
    }
}


/*
let toup = ReadStdin.read()
let string: String = toup.s
print(string)
let count: String = toup.c
print(count)


print(toup)
*/


class ReadStdin {
    
    func read(){
        
        var n: Int = 0
        var d: Int = 0
        var array: [Int] = []
        
        let numofInputLines = 2
        for _ in 1 ... numofInputLines {
            
            let line = readLine()!.characters.split(separator: " ").map{ Int(String($0))! }
            
            if line.count == 2 {
                n = line[0]
                d = line[1]
            } else {
                array = line
            }
        }
        print(n) // 5
        print(d) // 4
        print(array) // [1, 2, 3, 4, 5]
        
//        let timeInLot: Date = carInTime.hours(from: outTime)
        
    }
}



