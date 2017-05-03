//
//  Kata04DataMunging.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/28/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import Foundation

class KataFileReader {

    func readFile(fileName: String, fileExtention: String) throws -> String {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileExtention) else {
            throw  Kata04Errors.fileNotFound
        }
        
        do {
            let dataString: String = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return dataString
        }
    }
    
    
}
