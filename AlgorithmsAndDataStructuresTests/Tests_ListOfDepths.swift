//
//  Tests_ListOfDepths.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/15/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures


class Tests_ListOfDepths: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_AddQueue() {
        
        let tree = DepthLLTree()
        let node0 = DepthLLTreeNode(data: 0)
        let node1 = DepthLLTreeNode(data: 1)
        let node2 = DepthLLTreeNode(data: 2)
        
        tree.head = node0
        tree.head?.left = node1
        tree.head?.right = node2
        
        let factory = ListOfDepthsFactory()
        let result = factory.listOfDepths(tree: tree)
        
        let _ = ""
        XCTAssertNotNil(result)
        XCTAssertEqual(result[0]?.data, 0)
        XCTAssertEqual(result[1]?.data, 2)
        XCTAssertEqual(result[1]?.next?.data, 1)
        
    }

    
    func test_peakAndPop(){
        let queue = DepthLLQueue()
        
        let node0 = DepthLLTreeNode(data: 0)
        let node1 = DepthLLTreeNode(data: 1)
        let node2 = DepthLLTreeNode(data: 2)
        
        
        let n0 = DepthLLNode(treeNode: node0, level: 0)
        let n1 = DepthLLNode(treeNode: node1, level: 0)
        let n2 = DepthLLNode(treeNode: node2, level: 0)
        
        queue.add(node: n0)
        queue.add(node: n1)
        queue.add(node: n2)
        
        let result = queue.peakAndPop()
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.data, 0)
        
        let result2 = queue.peakAndPop()
        XCTAssertNotNil(result2)
        XCTAssertEqual(result2?.data, 1)
        
        let result3 = queue.peakAndPop()
        XCTAssertNotNil(result3)
        XCTAssertEqual(result3?.data, 2)
        
        let result4 = queue.peakAndPop()
        XCTAssertNil(result4)
        
        
        
        
        
    }
    


}
