//
//  Tests_Queue.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_Queue: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testisEmpty() {
        let queue = Queue()
        XCTAssert(queue.isEmpty() == true)
    }
    
    func testIsNotEmpty() {
        let queue = Queue()
        queue.add(data: "hello world")
        XCTAssert(queue.isEmpty() == false)
    }
    
    func testAdd() {
        let queue = Queue()
        queue.add(data: "hello world")
        XCTAssert(queue.peak() == "hello world")
    }
    
    func testNilPeak() {
        let queue = Queue()
        XCTAssert(queue.peak() == nil)
    }
    
    func testThatQueueAddsToEnd(){
        let queue = Queue()
        queue.add(data: "one")
        queue.add(data: "two")
        XCTAssert(queue.peak() == "one")
    }

    func testRemove() {
        let queue = Queue()
        queue.add(data: "one")
        queue.add(data: "two")
        queue.add(data: "three")
        queue.add(data: "four")
        queue.remove()
        XCTAssert(queue.peak() == "two")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
