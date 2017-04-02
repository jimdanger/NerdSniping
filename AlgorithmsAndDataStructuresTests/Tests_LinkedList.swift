//
//  Tests_LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_LinkedList: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSaveToLinkedList() {
        let list: LinkedList = LinkedList()
        let data = "one"
        list.save(data: data)
        XCTAssert(list.popHead() == data)
        
    }
    
    func testSaveMoreToLinkedList() {
        let list: LinkedList = LinkedList()
        list.save(data: "one")
        list.save(data: "two")
        let _ = list.popHead()
        XCTAssert(list.popHead() == "two")
    }
    
    func testPopHeadRemovesHead() {
        let list: LinkedList = LinkedList()
        list.save(data: "one")
        list.save(data: "two")
        let _ = list.popHead()
        XCTAssert(list.popHead() == "two")
    }

    func testRemoveNodeThatHasCertainData() {
        let list: LinkedList = LinkedList()
        list.save(data: "one")
        list.save(data: "two")
        list.save(data: "three")
        list.save(data: "four")
        list.save(data: "five")
        list.remove(data: "two")
        var array: [String] = []
        while list.headNode != nil {
            array.append(list.popHead()!)
        }
        let expectedArray = ["one","three", "four", "five"]
        
        XCTAssert(array == expectedArray)
    }
    
    func testNotfound () {
        let list: LinkedList = LinkedList()
        list.save(data: "one")
        list.save(data: "two")
        
        let nodeExpectedToBeNil = list.get(data: "three")
        XCTAssert(nodeExpectedToBeNil == nil)
    }
    
    func testFound () {
        let list: LinkedList = LinkedList()
        list.save(data: "one")
        list.save(data: "two")
        
        let node = list.get(data: "two")
        XCTAssert(node?.data == "two")
    }
}
