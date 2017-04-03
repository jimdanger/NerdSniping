//
//  ViewController.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("Run and explore the Unit Tests to see the logic run.")
        printLargeArrayToConsole()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func printLargeArrayToConsole(){
        
        var stringToPrint = ""
        stringToPrint.append("[")
        for _ in 0...100000 {
           stringToPrint.append("\((arc4random_uniform(100000) + 1)), ")
        }
        stringToPrint.append("]")
        print(stringToPrint)
    }
}

