//
//  RouteBetweenNodes.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 7/12/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//



/*
 
 Crack the Coding Interview 4.a:
 
 Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route beteen two nodes.
 
 */


import Foundation
class RouteBetweenNodes {
    
    class Graph {
        var nodes: [String : Node] = [ : ]
        
    }
    
    class Node {
        var id: String
        var data: Int?
        var children: [Node] = []
        
        
        init(id: String) {
            self.id = id
        }
        
    }
    
    var visitedNodes: [String : Node] = [ : ]
    
    func isRouteBetweenNodes(graph: Graph, a: Node, b: Node) -> Bool {
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
    
    
    
    func routeExists_dfs(current: Node, target: Node) -> Bool {
        
        
        if target.id == current.id {
            return true
        }
        for child in current.children {
            if !hasBeenVisited(visitedNodes:visitedNodes, id: child.id){
                return routeExists_dfs(current: child, target: target)
            }
        }
        return false 
    }
    
    func hasBeenVisited(visitedNodes:[String : Node], id: String) -> Bool {
        return visitedNodes[id] == nil ? false : true
    }
}


