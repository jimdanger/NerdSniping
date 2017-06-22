//
//  Tests_StackOfPlates.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/21/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_StackOfPlates: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_simplePush() {

        let stack = StackOfPlates()
        stack.push(plate: Plate(data: 1))
        guard let result = stack.pop()?.data else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(result, 1)
    }
    
    func test_PushMultipleItems_underThreshold() {
        
        let stack = StackOfPlates()
        stack.push(plate: Plate(data: 1))
        stack.push(plate: Plate(data: 2))
        stack.push(plate: Plate(data: 3))
        stack.push(plate: Plate(data: 4))
        guard let result = stack.pop()?.data else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(result, 4)
    }
    
    func test_Pop_MultipleItems_underThreshold() {
        
        let stack = StackOfPlates()
        stack.push(plate: Plate(data: 1))
        stack.push(plate: Plate(data: 2))
        stack.push(plate: Plate(data: 3))
        stack.push(plate: Plate(data: 4))
        let _ = stack.pop() // 4 
        let _ = stack.pop() // 3
        guard let result = stack.pop()?.data else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(result, 2)
    }
    
    func test_PopNil_MultipleItems_underThreshold() {
        
        let stack = StackOfPlates()
        stack.push(plate: Plate(data: 1))
        stack.push(plate: Plate(data: 2))
        stack.push(plate: Plate(data: 3))
        stack.push(plate: Plate(data: 4))
        let _ = stack.pop() // 4
        let _ = stack.pop() // 3
        let _ = stack.pop() // 2
        let _ = stack.pop() // 1
        let result = stack.pop()?.data
        XCTAssertEqual(result, nil)
    }
    
    
    func test_PushMultipleItems_AboveThreshold() {
        
        let stack = StackOfPlates()
        stack.push(plate: Plate(data: 1))
        stack.push(plate: Plate(data: 2))
        stack.push(plate: Plate(data: 3))
        stack.push(plate: Plate(data: 4))
        stack.push(plate: Plate(data: 5))
        stack.push(plate: Plate(data: 6))
        stack.push(plate: Plate(data: 7))
        guard let result = stack.pop()?.data else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(result, 7)
    }

    
    func test_PopMultipleItems_AboveThreshold() {
        
        let stack = StackOfPlates()
        stack.push(plate: Plate(data: 1))
        stack.push(plate: Plate(data: 2))
        stack.push(plate: Plate(data: 3))
        stack.push(plate: Plate(data: 4))
        stack.push(plate: Plate(data: 5))
        stack.push(plate: Plate(data: 6))
        stack.push(plate: Plate(data: 7))
        let _ = stack.pop() // 7
        let _ = stack.pop() // 6
        let _ = stack.pop() // 5
        let _ = stack.pop() // 4
        guard let result = stack.pop()?.data else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(result, 3)
    }
}
