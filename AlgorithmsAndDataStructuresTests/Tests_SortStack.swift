//
//  Tests_SortStack.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/21/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures


class Tests_SortStack: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }

    
    func test_push () {
        let stack = SortStack()
        stack.push(item: SortStackNode(data: 3))
        let result = stack.peek()?.data
        XCTAssertEqual(result, 3)
    }
    
    func test_push2 () {
        let stack = SortStack()
        stack.push(item: SortStackNode(data: 3))
        stack.push(item: SortStackNode(data: 2))
        let result = stack.peek()?.data
        XCTAssertEqual(result, 2)
    }
    
    func test_pop () {
        let stack = SortStack()
        stack.push(item: SortStackNode(data: 3))
        stack.push(item: SortStackNode(data: 2))
        stack.pop()
        let result = stack.peek()?.data
        XCTAssertEqual(result, 3)
    }
    
    
    func test_sorting () {
        let stack = SortStack()
        stack.push(item: SortStackNode(data: 1))
        stack.push(item: SortStackNode(data: 2))
        stack.push(item: SortStackNode(data: 3))
        let result = stack.peek()?.data
        XCTAssertEqual(result, 1)
    }
   
}
