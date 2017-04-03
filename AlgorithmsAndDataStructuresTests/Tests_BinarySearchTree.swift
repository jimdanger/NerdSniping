//
//  Tests_BinarySearchTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/3/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_BinarySearchTree: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }

    // MARK: - Put
    func testPutWontCrashApp() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        XCTAssertEqual(bst.getRootValue(), 5)
    }
    
    func testPutWontCrashApp2() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        bst.put(value: 2)
        bst.put(value: 1)
        bst.put(value: 4)
        bst.put(value: 6)
        bst.put(value: 7)
        XCTAssertEqual(bst.getRootValue(), 5)
    }
    
    func testPutWontCrashApp3() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        bst.put(value: -100)
        bst.put(value: 100000)
        XCTAssertEqual(bst.getRootValue(), 5)
    }
    
    func testPutLeft() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        bst.put(value: 3) // should be left child of 5
        XCTAssertEqual(bst.root?.left?.value, 3)
    }
    
    func testPutRight() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        bst.put(value: 6) // should be right child of 5
        XCTAssertEqual(bst.root?.right?.value, 6)
    }
    
    func testPutLotsOfStuff() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        
        // Note: typically bad practice to use more than one assert in a test.
        XCTAssertEqual(bst.root?.left?.value, 3)
        XCTAssertEqual(bst.root?.left?.left?.value, 2)
        XCTAssertEqual(bst.root?.left?.right?.value, 4)
        XCTAssertEqual(bst.root?.right?.value, 8)
        XCTAssertEqual(bst.root?.left?.left?.left?.value, 1)
        XCTAssertEqual(bst.root?.left?.left?.left?.right?.value, nil) // one has no children 
        XCTAssertEqual(bst.root?.left?.left?.left?.left?.value, nil) // one has no children
    }
    
    func putStuff(bst: BinarySearchTree) {
        bst.put(value: 5) // root
        bst.put(value: 3) // left child of root
        bst.put(value: 2) // left child of 3
        bst.put(value: 4) // right child of 3
        bst.put(value: 8) // right child of root
        bst.put(value: 6) // left child of 8
        bst.put(value: 1) // left child of 2
    }
    

    // MARK: - Depth First Search
    func testDepthFirstSearchStartMatchesTarget() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        let result = bst.depthFirstSearch(start: bst.root!, target: 5)?.value
        XCTAssertEqual(result, 5)
    }
    
    func testDepthFirstSearchStartMatchesTargetNotEqual() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        let result = bst.depthFirstSearch(start: bst.root!, target: 5)?.value
        XCTAssertNotEqual(result, 3)
    }
    
    func testDepthFirstSearch() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        let resultNode = bst.depthFirstSearch(start: bst.root!, target: 1)
        XCTAssertEqual(resultNode?.value, 1)
    }
    
    func testDepthFirstSearch2() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        let resultNode = bst.depthFirstSearch(start: bst.root!, target: 8)
        XCTAssertEqual(resultNode?.value, 8)
    }
    
    func testDepthFirstSearchNotFound() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        let resultNode = bst.depthFirstSearch(start: bst.root!, target: 20)
        XCTAssertEqual(resultNode?.value, nil)
    }
    
    func testHugeBstDfs() {
        let bst = BinarySearchTree()
        
        self.putTonsOfStuff(bst: bst)
        
        let value = Int((arc4random_uniform(10000) + 1))
        bst.put(value: value) // to ensure this test will pass
        var resultNode = bst.root
        self.measure {
            resultNode = bst.depthFirstSearch(start: bst.root!, target: value)
        }
        XCTAssertEqual(resultNode?.value, value)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        
    }
    
    func putTonsOfStuff(bst: BinarySearchTree) {

        for element in LargeArrayOfRandomInt.instance {
            bst.put(value: element)
        }
    }
    
    
    // MARK:- Breadth First Search Queue (Needed for search itself)
    func testisEmpty() {
        let queue = BinarySearchTree.BreadthFirstSearchQueue()
        XCTAssert(queue.isEmpty() == true)
    }
    
    func testIsNotEmpty() {
        let queue = BinarySearchTree.BreadthFirstSearchQueue()
        let bstNode = BinarySearchTree.BstNode(value: 1)
        queue.add(data: bstNode)
        XCTAssert(queue.isEmpty() == false)
    }
    
    func testAdd() {
        let queue = BinarySearchTree.BreadthFirstSearchQueue()
        let bstNode = BinarySearchTree.BstNode(value: 1)
        queue.add(data: bstNode)
        XCTAssert(queue.peakAndRemove()?.value == 1)
    }
    
    func testNilPeak() {
        let queue = BinarySearchTree.BreadthFirstSearchQueue()
        XCTAssert(queue.peakAndRemove() == nil)
    }
    
    func testThatQueueAddsToEnd(){
        let queue = BinarySearchTree.BreadthFirstSearchQueue()
        queue.add(data: BinarySearchTree.BstNode(value: 1))
        queue.add(data: BinarySearchTree.BstNode(value: 2))
        XCTAssert(queue.peakAndRemove()?.value == 1)
    }
    
    func testRemove() {
        let queue = BinarySearchTree.BreadthFirstSearchQueue()
        queue.add(data: BinarySearchTree.BstNode(value: 1))
        queue.add(data: BinarySearchTree.BstNode(value: 2))
        queue.add(data: BinarySearchTree.BstNode(value: 3))
        queue.add(data: BinarySearchTree.BstNode(value: 4))
        let _ = queue.peakAndRemove()
        XCTAssert(queue.peakAndRemove()?.value == 2)
    }
    
    
    // MARK:- Breadth First Search
    
    func testBreadthFirstSearchStartMatchesTarget() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        let result = bst.breadthFirstSearch(start: bst.root!, target: 5)?.value
        XCTAssertEqual(result, 5)
    }
    
    func testBreadthFirstSearchStartMatchesTargetNotEqual() {
        let bst = BinarySearchTree()
        bst.put(value: 5)
        let result = bst.breadthFirstSearch(start: bst.root!, target: 5)?.value
        XCTAssertNotEqual(result, 3)
    }
    
    func testBreadthFirstSearch() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        let resultNode = bst.breadthFirstSearch(start: bst.root!, target: 1)
        XCTAssertEqual(resultNode?.value, 1)
    }
    
    func testBreadthFirstSearch2() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        let resultNode = bst.breadthFirstSearch(start: bst.root!, target: 8)
        XCTAssertEqual(resultNode?.value, 8)
    }
    
    func testBreadthFirstSearchNotFound() {
        let bst = BinarySearchTree()
        putStuff(bst: bst)
        let resultNode = bst.breadthFirstSearch(start: bst.root!, target: 20)
        XCTAssertEqual(resultNode?.value, nil)
    }
    
    func testHugeBstBfs() {
        let bst = BinarySearchTree()
        
        self.putTonsOfStuff(bst: bst)
        
        bst.put(value: 9999) // to ensure this test will pass
        var resultNode = bst.root
        self.measure {
            resultNode = bst.breadthFirstSearch(start: bst.root!, target: 9999)
        }
        XCTAssertEqual(resultNode?.value, 9999)
    }


    
    
    
}
