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
    
    // MARK: - ArraysAndStringsIsUnique
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
    
    func test_isUnique_UniqueReturnsTrue_ByIterating() {
        
        let arraysAndStringsIsUnique: ArraysAndStringsIsUnique = ArraysAndStringsIsUnique()
        let uniqueString = "asdfghjk"
        let result = arraysAndStringsIsUnique.isUnique(string: uniqueString, determineByIterating: true)
        XCTAssert(result)
    }
    
    func test_isUnique_NonUniqueReturnsFalse_ByIterating() {
        
        let arraysAndStringsIsUnique: ArraysAndStringsIsUnique = ArraysAndStringsIsUnique()
        let nonUniqueString = "asdfghjka"
        let result = arraysAndStringsIsUnique.isUnique(string: nonUniqueString, determineByIterating: true)
        XCTAssert(!result)
    }
    
    func test_isUnique_UniqueReturnsTrue_ByHashing_TestForTypoInAsNumberExtention() {
        
        let arraysAndStringsIsUnique: ArraysAndStringsIsUnique = ArraysAndStringsIsUnique()
        let nonUniqueString = "ABC DEFGHIJKLMNOPQRSTUVWXYZ"
        let result = arraysAndStringsIsUnique.isUnique(string: nonUniqueString, determineByIterating: true)
        XCTAssert(result)
    }
    
    // MARK: - CheckPermutation
    
    func test_isPermutationFalseWhenDifferentLengths(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "a"
        let s2 = "ab"
        XCTAssert(!checker.isPermutation(string1: s1, string2: s2))
    }
    
    func test_worksWithNoDuplicates_True(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "asdf"
        let s2 = "fdsa"
        XCTAssert(checker.isPermutation(string1: s1, string2: s2))
    }
    
    func test_worksWithNoDuplicates_False(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "abcd"
        let s2 = "cbaz"
        XCTAssert(!checker.isPermutation(string1: s1, string2: s2))
    }
    
    func test_worksWithDuplicates_True(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "aasdf"
        let s2 = "fdsaa"
        XCTAssert(checker.isPermutation(string1: s1, string2: s2))
    }
    
    func test_worksWithDuplicates_False(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "aabcd"
        let s2 = "abbcd"
        XCTAssert(!checker.isPermutation(string1: s1, string2: s2))
    }

}
