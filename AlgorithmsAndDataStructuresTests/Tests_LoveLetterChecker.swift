//
//  Tests_LoveLetterChecker.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/27/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures


class Tests_LoveLetterChecker: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func test_loveLetterChecker_shouldPass(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = "aabbcc"
        
        let result = checker.canBeWrittenEntirelyFrom(letter: letter, newspaper: newspaper)
        XCTAssert(result)
    }
    
    func test_loveLetterChecker_shouldFail(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = "a"
        
        let result = checker.canBeWrittenEntirelyFrom(letter: letter, newspaper: newspaper)
        XCTAssertFalse(result)
    }
    
    func test_loveLetterChecker_shouldPass2(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = "abc"
        
        let result = checker.canBeWrittenEntirelyFrom(letter: letter, newspaper: newspaper)
        XCTAssert(result)
    }
    
    func test_loveLetterChecker_shouldFailIfEmpty(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = ""
        
        let result = checker.canBeWrittenEntirelyFrom(letter: letter, newspaper: newspaper)
        XCTAssertFalse(result)
    }
    
    // MARK: - useing hash instead of nested for loops
   
    func test_loveLetterChecker_shouldPass_hash(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = "aabbcc"
        
        let result = checker.canBeWrittenEntirelyFrom2(letter: letter, newspaper: newspaper)
        XCTAssert(result)
    }
    
    func test_loveLetterChecker_shouldFail_hash(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = "a"
        
        let result = checker.canBeWrittenEntirelyFrom2(letter: letter, newspaper: newspaper)
        XCTAssertFalse(result)
    }
    
    func test_loveLetterChecker_shouldPass2_hash(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = "abc"
        
        let result = checker.canBeWrittenEntirelyFrom2(letter: letter, newspaper: newspaper)
        XCTAssert(result)
    }
    
    func test_loveLetterChecker_shouldFailIfEmpty_hash(){
        let checker = LoveLetterChecker()
        let letter = "abc"
        let newspaper = ""
        
        let result = checker.canBeWrittenEntirelyFrom2(letter: letter, newspaper: newspaper)
        XCTAssertFalse(result)
    }
    
    func test_loveLetterChecker_shouldFail_ranoutOfChars_hash(){
        let checker = LoveLetterChecker()
        let letter = "abcc"
        let newspaper = "abc"
        
        let result = checker.canBeWrittenEntirelyFrom2(letter: letter, newspaper: newspaper)
        XCTAssertFalse(result)
    }
    
    
    
    
    
}
