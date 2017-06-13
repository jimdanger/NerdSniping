//
//  Tests_Ctci_LinkedLists.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/13/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_Ctci_LinkedLists: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }

    // MARK: LLRemoveDupes
    func getStringFrom(ll: LinkedList) -> String {
        var node = ll.headNode
        var data = ""
        while node != nil {
            if let d = node?.data {
                data.append(d)
            }
            node = node?.nextNode
        }
        return data
        
    }
    
    func test_getStringFrom() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups()
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes2() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups()
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes3() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups()
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes4() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups()
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }

    
    

   

}
