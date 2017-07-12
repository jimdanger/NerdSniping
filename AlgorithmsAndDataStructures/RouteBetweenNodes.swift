//
//  RouteBetweenNodes.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/12/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//



/*
 
 Crack the Coding Interview 4.1:
 
 Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route beteen two nodes.
 
 */


import Foundation

class Graph_rbn {
    var nodes: [String : Node_rbn] = [ : ]
    func add(node: Node_rbn) {
        nodes[node.id] = node
    }
}

class Node_rbn {
    var id: String
    var data: Int?
    var children: [Node_rbn] = []
    
    
    init(id: String) {
        self.id = id
    }
}

class RouteBetweenNodes {
    
    var visitedNodes: [String : Node_rbn] = [ : ]
    
    func isRouteBetweenNodes(graph: Graph_rbn, a: Node_rbn, b: Node_rbn) -> Bool {
        visitedNodes = [ : ]
        if routeExists_dfs(current: a, target: b) {
            return true
        }
        visitedNodes = [ : ]
        if routeExists_dfs(current: b, target: a) {
            return true
        }
        return false
    }
    
    func routeExists_dfs(current: Node_rbn, target: Node_rbn) -> Bool {
        visitedNodes[current.id] = current
        if target.id == current.id {
            return true
        }
        var result = false
        for child in current.children {
            if !hasBeenVisited(visitedNodes:visitedNodes, id: child.id){
                if routeExists_dfs(current: child, target: target) {
                    result = true
                }
            }
        }
        return result
    }
    
    func hasBeenVisited(visitedNodes:[String : Node_rbn], id: String) -> Bool {
        return visitedNodes[id] == nil ? false : true
    }
}


