//
//  QueueNode.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


class QueueNode {
    typealias T = String
    var data: T?
    var next: QueueNode?
    
    init (data: T) {
        self.data = data
    }
}
