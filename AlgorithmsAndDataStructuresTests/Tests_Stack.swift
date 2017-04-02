//
//  Tests_Stack.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_Stack: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIsEmpty() {
        let stack = Stack()
        XCTAssert(stack.isEmpty() == true)
    }
    
    func testIsNotEmpty() {
        let stack = Stack()
        let data: String = "hello world"
        stack.push(data: data)
        XCTAssert(stack.isEmpty() == false)
    }
    
    func testPush() {
        let data: String = "hello world"
        let stack = Stack()
        stack.push(data: data)
        XCTAssert(stack.peak() == data)
    
    }
    
    func testPop() {
        let stack = Stack()
        stack.push(data: "one")
        stack.push(data: "two")
        stack.push(data: "three")
        stack.pop()
        XCTAssert(stack.peak() == "two")
    }
}
