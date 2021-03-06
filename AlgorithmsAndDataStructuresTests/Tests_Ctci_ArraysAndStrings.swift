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
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here. 
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
    
    
    // MARK: - CheckPermutation using iteration instead of sorting
    
    func test_isPermutationFalseWhenDifferentLengths_byIterating(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "a"
        let s2 = "ab"
        XCTAssert(!checker.isPermutation(string1: s1, string2: s2, bySorting: false))
    }
    
    func test_worksWithNoDuplicates_True_byIterating(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "asdf"
        let s2 = "fdsa"
        XCTAssert(checker.isPermutation(string1: s1, string2: s2, bySorting: false))
    }
    
    func test_worksWithNoDuplicates_False_byIterating(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "abcd"
        let s2 = "cbaz"
        XCTAssert(!checker.isPermutation(string1: s1, string2: s2, bySorting: false))
    }
    
    func test_worksWithDuplicates_True_byIterating(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "aasdf"
        let s2 = "fdsaa"
        XCTAssert(checker.isPermutation(string1: s1, string2: s2, bySorting: false))
    }
    
    func test_worksWithDuplicates_False_byIterating(){
        
        let checker: StringPermutationChecker = StringPermutationChecker()
        let s1 = "aabcd"
        let s2 = "abbcd"
        XCTAssert(!checker.isPermutation(string1: s1, string2: s2, bySorting: false))
    }
    
    
    // MARK: - URLify 
    
    func test_URLify(){
        
        let uRLifyer: URLifyer = URLifyer()
        let s = "thisIsAStringWithA space"
        let result = "thisIsAStringWithA%20space"
        XCTAssert(result == uRLifyer.urlify(string: s))
    }
    
    func test_URLify2(){
        
        let uRLifyer: URLifyer = URLifyer()
        let s = "asdf"
        let result = "asdf"
        XCTAssert(result == uRLifyer.urlify(string: s))
    }
    
    func test_URLify3(){
        
        let uRLifyer: URLifyer = URLifyer()
        let s = "as df"
        let result = "asdf"
        XCTAssert(result != uRLifyer.urlify(string: s))
    }
    
    func test_URLify4(){
        
        let uRLifyer: URLifyer = URLifyer()
        let s = "a s d f"
        let result = "a%20s%20d%20f"
        XCTAssert(result == uRLifyer.urlify(string: s))
    }
    
    // MARK: - PalindromePermutationChecker.swift
    
    func test_isPalindrome_falseIfDifferentLength(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s1 = "a"
        let s2 = "bc"
        let result = checker.isPalindrome(s1: s1, s2: s2)
        XCTAssert(!result)
    }
    
    
    
    func test_isPalindrome(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s1 = "abc"
        let s2 = "cba"
        let result = checker.isPalindrome(s1: s1, s2: s2)
        XCTAssert(result)
    }
    
    func test_isPalindrome_false(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s1 = "abcd"
        let s2 = "dcbx"
        let result = checker.isPalindrome(s1: s1, s2: s2)
        XCTAssert(!result)
    }
    
    func test_removeSpaces(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "a b c"
        let expectedResult = "abc"
        let result = checker.removeSpaces(string: s)
        XCTAssert(result == expectedResult)
    }
    
    
    func test_removeSpaces2(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "abc"
        let expectedResult = "abc"
        let result = checker.removeSpaces(string: s)
        XCTAssert(result == expectedResult)
    }
    
    func test_isPermutationOfPalindrome(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "abc"
        let result = checker.isPermutationOfPalindrome(string: s)
        XCTAssert(!result)
    }
    
    func test_isPermutationOfPalindrome2(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "aca"
        let result = checker.isPermutationOfPalindrome(string: s)
        XCTAssert(result)
    }
    
    func test_isPermutationOfPalindrome3(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "aacaab"
        let result = checker.isPermutationOfPalindrome(string: s)
        XCTAssert(!result)
    }
    
    func test_isPermutationOfPalindrome4(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "aacaacasdffdsa"
        let result = checker.isPermutationOfPalindrome(string: s)
        XCTAssert(result)
    }
    
    func test_isPermutationOfPalindrome5(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "ahah"
        let result = checker.isPermutationOfPalindrome(string: s)
        XCTAssert(result)
    }
    
    func test_isPermutationOfPalindrome6(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let s = "ahaha"
        let result = checker.isPermutationOfPalindrome(string: s)
        XCTAssert(result)
    }
    
    func test_isEven(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let n = 2
        let result = checker.isEven(number: n)
        XCTAssert(result)
    }
    
    func test_isOdd(){
        
        let checker: PalindromePermutationChecker = PalindromePermutationChecker()
        let n = 3
        let result = !checker.isEven(number: n)
        XCTAssert(result)
    }
    
    
    // MARK: - StringCompresser.swift - isCompressable
    func test_isCompressable() {
        let s = "asdf"
        XCTAssert(!s.isCompressable())
    }
    func test_isCompressable2() {
        let s = ""
        XCTAssert(!s.isCompressable())
    }
    
    func test_isCompressable3() {
        let s = "aa"
        XCTAssert(!s.isCompressable())
    }
    
    func test_isCompressable4() {
        let s = "asdff"
        XCTAssert(!s.isCompressable())
    }
    
    func test_isCompressable5() {
        let s = "asddf"
        XCTAssert(!s.isCompressable())
    }
    
    func test_isCompressable6() {
        let s = "aaa"
        XCTAssert(s.isCompressable())
    }
    
    func test_isCompressable7() {
        let s = "aaab"
        XCTAssert(s.isCompressable())
    }
    
    func test_isCompressable8() {
        let s = "abbbc"
        XCTAssert(s.isCompressable())
    }
    
    // MARK: - StringCompresser.swift - compress
    
    func test_compress_returnsSame() {
        let compresser = StringCompresser()
        let s = "asdf"
        XCTAssert(compresser.compress(s: s) == s)
    }
    
    func test_compress_returnsSame2() {
        let compresser = StringCompresser()
        let s = ""
        XCTAssert(compresser.compress(s: s) == s)
    }
    
    func test_compress_returnsSame3() {
        let compresser = StringCompresser()
        let s = "aabbcc"
        let expectedResult = "aabbcc"
        XCTAssertEqual(compresser.compress(s: s), expectedResult)
    }
    
    func test_appendOrReplace(){
        var s = "a"
        let expectedResult = "a5"
        let result = s.appendNumberOrReplaceLastNumberWith(x: 5)
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_appendOrReplace2(){
        var s = "a1"
        let expectedResult = "a2"
        let result = s.appendNumberOrReplaceLastNumberWith(x: 2)
        XCTAssertEqual(result, expectedResult)
    }
    
    
    func test_compress() {
        let compresser = StringCompresser()
        let s = "aaabbcc"
        let expectedResult = "a3b2c2"
        XCTAssertEqual(compresser.compress(s: s), expectedResult)
    }
    
    func test_compress2() {
        let compresser = StringCompresser()
        let s = "abbccc"
        let expectedResult = "ab2c3"
        XCTAssertEqual(compresser.compress(s: s), expectedResult)
    }
    
}
