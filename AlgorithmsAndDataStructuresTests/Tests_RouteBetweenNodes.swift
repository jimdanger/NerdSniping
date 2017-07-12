//
//  Tests_RouteBetweenNodes.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/12/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


import XCTest
@testable import AlgorithmsAndDataStructures


class Tests_RouteBetweenNodes: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func makeGraph() -> Graph_rbn {
        
        // make graph in photo on page 107 of book.
        
        let node = Node_rbn(id:"0")
        let node1 = Node_rbn(id:"1")
        let node2 = Node_rbn(id:"2")
        let node3 = Node_rbn(id:"3")
        let node4 = Node_rbn(id:"4")
        let node5 = Node_rbn(id:"5")
        
        node.children = [node1, node4, node5]
        node1.children = [node4, node3]
        node2.children = [node1]
        node3.children = [node2, node4]
        node4.children = []
        node5.children = []
        
        let graph = Graph_rbn()
        graph.add(node: node)
        graph.add(node: node1)
        graph.add(node: node2)
        graph.add(node: node3)
        graph.add(node: node4)
        graph.add(node: node5)
        
        return graph
    }
    func test_graphMadeProperly() {
        
        let graph = makeGraph()

        XCTAssertNotNil(graph.nodes["0"])
        XCTAssertNotNil(graph.nodes["1"])
        XCTAssertNotNil(graph.nodes["2"])
        XCTAssertNotNil(graph.nodes["3"])
        XCTAssertNotNil(graph.nodes["4"])
        XCTAssertNotNil(graph.nodes["5"])

        XCTAssertEqual(graph.nodes["0"]?.children[0].id, "1")
        XCTAssertEqual(graph.nodes["0"]?.children[1].id, "4")
        XCTAssertEqual(graph.nodes["0"]?.children[2].id, "5")
        XCTAssertEqual(graph.nodes["0"]?.children.count, 3)
        
        XCTAssertEqual(graph.nodes["1"]?.children.count, 2)
        XCTAssertEqual(graph.nodes["1"]?.children[0].id, "4")
        XCTAssertEqual(graph.nodes["1"]?.children[1].id, "3")
        
        XCTAssertEqual(graph.nodes["2"]?.children.count, 1)
        XCTAssertEqual(graph.nodes["2"]?.children[0].id, "1")
        
        XCTAssertEqual(graph.nodes["3"]?.children.count, 2)
        XCTAssertEqual(graph.nodes["3"]?.children[0].id, "2")
        XCTAssertEqual(graph.nodes["3"]?.children[1].id, "4")
        
        XCTAssertEqual(graph.nodes["4"]?.children.count, 0)
        XCTAssertEqual(graph.nodes["5"]?.children.count, 0)
    }
    
    func test_isRouteBetweenNodes(){
        let graph = makeGraph()
        let worker = RouteBetweenNodes()
        let result = worker.isRouteBetweenNodes(graph: graph, a: graph.nodes["0"]!, b: graph.nodes["3"]!)
        XCTAssert(result)
        
        let result2 = worker.isRouteBetweenNodes(graph: graph, a: graph.nodes["3"]!, b: graph.nodes["0"]!)
        XCTAssert(result2)

        let result3 = worker.isRouteBetweenNodes(graph: graph, a: graph.nodes["1"]!, b: graph.nodes["3"]!)
        XCTAssert(result3)
        
    }
    
    func test_isRouteBetweenNodes_false(){
        let graph = makeGraph()
        let unattached = Node_rbn(id:"6")
        graph.add(node: unattached)
        
        let worker = RouteBetweenNodes()
        let result = worker.isRouteBetweenNodes(graph: graph, a: graph.nodes["0"]!, b: unattached)
        XCTAssert(!result)
    }
    
}

