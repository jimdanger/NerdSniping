//
//  Tests_Ctci_ArraysAndStrings.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/8/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import Foundation



import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_Ctci_ArraysAndStrings: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_isUnique_UniqueReturnsTrue() {
       
        let arraysAndStringsIsUnique: ArraysAndStringsIsUnique = ArraysAndStringsIsUnique()
        let uniqueString = "asdfghjk"
        let result = arraysAndStringsIsUnique.isUnique(string: uniqueString)
        XCTAssert(result)
    }
    
    func test_isUnique_NonUniqueReturnsFalse() {
        
        let arraysAndStringsIsUnique: ArraysAndStringsIsUnique = ArraysAndStringsIsUnique()
        let nonUniqueString = "asdfghjka"
        let result = arraysAndStringsIsUnique.isUnique(string: nonUniqueString)
        XCTAssert(!result)
        
    }

}
