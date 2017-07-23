//
//  Tests_CheckBalanced.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/16/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_CheckBalanced: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
 
    func test_height() {
        let x = CheckBalanced()
        let root = CBNode(data: 0)
        XCTAssertEqual(x.height(node: root), 0)
        
        let l = CBNode(data: 1)
        let r = CBNode(data: 2)
        root.left = l
        root.right = r
        XCTAssertEqual(x.height(node: root), 1)
    
        let ll = CBNode(data: 3)
        let rr = CBNode(data: 4)
        l.left = ll
        r.right = rr
        XCTAssertEqual(x.height(node: root), 2)

        let lll = CBNode(data: 5)
        let rrr = CBNode(data: 6)
        ll.left = lll
        ll.right = rrr
        XCTAssertEqual(x.height(node: root), 3)
    }
    
    func test_isBalanced() {
        
        let x = CheckBalanced()
        let root = CBNode(data: 0)
        let rootLeft = CBNode(data: 0)
        root.left = rootLeft
        let rootleftleft = CBNode(data: 0)
        root.left?.left = rootleftleft
        
        XCTAssertFalse(x.isBalanced(root: root))
    }
}
