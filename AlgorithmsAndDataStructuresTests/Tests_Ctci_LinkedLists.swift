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

    // MARK: LLRemoveDupes - by iterating
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
        lLRemoveDupes.removeDups(by: .iterating)
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
        lLRemoveDupes.removeDups(by: .iterating)
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
        lLRemoveDupes.removeDups(by: .iterating)
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
        lLRemoveDupes.removeDups(by: .iterating)
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }

    // MARK: LLRemoveDupes - by hashTable
    func test_LLRemoveDupes_hash() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups(by: .hashTable)
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes2_hash() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups(by: .hashTable)
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
  
    func test_LLRemoveDupes2a_hash() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups(by: .hashTable)
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes3_hash() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups(by: .hashTable)
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }
    
    func test_LLRemoveDupes4_hash() {
        let lLRemoveDupes = LLRemoveDupes()
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "b")
        lLRemoveDupes.save(data: "a")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.save(data: "c")
        lLRemoveDupes.removeDups(by: .hashTable)
        let allData = getStringFrom(ll: lLRemoveDupes)
        let expectedResult = "abc"
        XCTAssertEqual(expectedResult, allData)
    }

    // MARK: LLReturnKthToLast - getKthToLast
    
    func test_LLReturnKthToLast_getKthToLast_returnsNextToLast() {
        let ll = LLReturnKthToLast()
        ll.save(data: "a")
        ll.save(data: "b")
        ll.save(data: "c")
        ll.save(data: "d")
        ll.save(data: "e")
        ll.save(data: "f")
        
        let result = ll.getKthToLast(k: 1)?.data
        let expectedResult = "e"
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_LLReturnKthToLast_getKthToLast_returns3rdToLast() {
        let ll = LLReturnKthToLast()
        ll.save(data: "a")
        ll.save(data: "b")
        ll.save(data: "c")
        ll.save(data: "d")
        ll.save(data: "e")
        ll.save(data: "f")
        
        let result = ll.getKthToLast(k: 3)?.data
        let expectedResult = "c"
        XCTAssertEqual(expectedResult, result)
    }

    func test_LLReturnKthToLast_getKthToLast_returnsNil() {
        let ll = LLReturnKthToLast()
        ll.save(data: "a")
        ll.save(data: "b")
        ll.save(data: "c")
        ll.save(data: "d")
        ll.save(data: "e")
        ll.save(data: "f")
        let result = ll.getKthToLast(k: 20)?.data
        XCTAssertNil(result)
    }
    
    func test_LLReturnKthToLast_getKthToLast_returnsLast() {
        let ll = LLReturnKthToLast()
        ll.save(data: "a")
        ll.save(data: "b")
        ll.save(data: "c")
        ll.save(data: "d")
        ll.save(data: "e")
        ll.save(data: "f")
        let result = ll.getKthToLast(k: 0)?.data
        let expectedResult = "f"
        XCTAssertEqual(expectedResult, result)
    }

    
    // MARK: LinkedList - Equatable
    
    func test_LinkedList_Equatable_equal() {
        let ll1 = LinkedList()
        ll1.save(data: "a")
        ll1.save(data: "b")
        
        let ll2 = LinkedList()
        ll2.save(data: "a")
        ll2.save(data: "b")
        
        XCTAssertEqual(ll1, ll2)
    }
    
    func test_LinkedList_Equatable_notEqual() {
        let ll1 = LinkedList()
        ll1.save(data: "a")
        
        let ll2 = LinkedList()
        ll2.save(data: "a")
        ll2.save(data: "b")
        
        XCTAssertNotEqual(ll1, ll2)
    }
    
    func test_LinkedList_Equatable_notEqual_Empty() {
        let ll1 = LinkedList()
        ll1.save(data: "a")
        
        let ll2 = LinkedList()
        
        XCTAssertNotEqual(ll1, ll2)
    }
    
    func test_LinkedList_Equatable_Equal_Empty() {
        let ll1 = LinkedList()
        let ll2 = LinkedList()
        XCTAssertEqual(ll1, ll2)
    }
    
    
    // MARK: LLDeleteMiddleNode - deleteMiddleNode

    func test_LLDeleteMiddleNode() {
        let ll = LLDeleteMiddleNode()
        ll.save(data: "a")
        ll.save(data: "b")
        ll.save(data: "c")
        ll.save(data: "d")
        ll.save(data: "e")
        ll.save(data: "f")
        
        let nodeTodelete:LinkedListNode = ll.getKthToLast(k: 3)!
        ll.deleteMiddleNode(node: nodeTodelete)
        
        let expectedresult = LLDeleteMiddleNode()
        expectedresult.save(data: "a")
        expectedresult.save(data: "b")
        expectedresult.save(data: "d")
        expectedresult.save(data: "e")
        expectedresult.save(data: "f")
        
        print(ll.getString())
        XCTAssertEqual(ll, expectedresult)
        
    }
    

   

}