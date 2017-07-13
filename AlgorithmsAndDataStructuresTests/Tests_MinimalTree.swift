//
//  Tests_MinimalTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/13/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures


class Tests_MinimalTree: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPerformanceExample() {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_SimpleTree() {
        let array: [Int] = [1,2,3]
        let tree = MinimalTree (array: array)
        XCTAssertNotNil(tree.root)
        let expectedRoot = 2
        let expectedLeft = 1
        let expectedRight = 3
        XCTAssertEqual(tree.root?.data, expectedRoot)
        XCTAssertEqual(tree.root?.left?.data, expectedLeft)
        XCTAssertEqual(tree.root?.right?.data, expectedRight)
    }

    func test_SimpleTree_edgeCase_NoElementes() {
        let array: [Int] = []
        let tree = MinimalTree (array: array)
        XCTAssertNil(tree.root)
    }
    
    func test_SimpleTree_edgeCase_oneElement() {
        let array: [Int] = [1]
        let tree = MinimalTree (array: array)
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.data, 1)
        XCTAssertNil(tree.root?.left)
        XCTAssertNil(tree.root?.right)
    }
    
    func test_SimpleTree_edgeCase_TwoElement() {
        let array: [Int] = [1,100]
        let tree = MinimalTree (array: array)
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.data, 100)
        XCTAssertEqual(tree.root?.left?.data, 1)
        
    }
    
    func test_SimpleTree_RecursingElements() {
        let array: [Int] = [1,2,3,4,5,6,7]
        let tree = MinimalTree (array: array)
        XCTAssertEqual(tree.root?.data, 4)
        XCTAssertEqual(tree.root?.left?.data, 2)
        XCTAssertEqual(tree.root?.right?.data, 6)
        
        XCTAssertEqual(tree.root?.left?.left?.data, 1)
        XCTAssertEqual(tree.root?.left?.right?.data, 3)
        
        XCTAssertEqual(tree.root?.right?.left?.data, 5)
        XCTAssertEqual(tree.root?.right?.right?.data, 7)
    }
    
    func test_MinimumHeight() {
        let array: [Int] = Array(1...10000) // with 10,000 elements, we expect the height to be 14. Log(base2)(10,000) = 13.3
        let tree = MinimalTree (array: array)
        
        var height = 1
        var node = tree.root?.left
        while node != nil {
            height += 1
            node = node?.left
        }
        XCTAssertEqual(height, 14)
    }
}
