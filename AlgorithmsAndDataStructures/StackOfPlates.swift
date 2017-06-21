//
//  StackOfPlates.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 6/21/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

/**
 
 Crack the Coding Interview 3.3:
 
  Imagine a (literal) stack of plates. If the stack gets too high, it
  might topple. Therefore, in real life, we would likely start a new
  stack when the previous stack exceeds some threshold. Implement a
  data structure SetOfStacks that mimics this. SetOfStacks should be
  composed of several stacks and should create a new stack once the
  previous one exceeds capacity. SetOfStacks.push() and SetOfStacks.pop()
  should behave identically to a single stack (that is, pop() should
  return the same values as it would if there were just a single stack).
 
  FOLLOW UP
  Implement a function popAt(int index) which performs a pop operation
  on a specific sub-stack.
 
 */


class StackOfPlates  {
    
    var threshold: Int = 5
    private var arrayOfStacks: [SubstackOfPlates] = []
    
    func push(plate: Plate) {
        if arrayOfStacks.isEmpty {
            arrayOfStacks.append(SubstackOfPlates())
        }
        if let lastSubstack = arrayOfStacks.last {
            
            if lastSubstack.count < threshold{
                lastSubstack.push(plate: plate)
            } else {
                arrayOfStacks.append(SubstackOfPlates())
                push(plate: plate)
            }
        }
    }
    func pop() -> Plate? {
        
        guard let substack = arrayOfStacks.last else {
            return nil
        }
        let plateToReturn = substack.pop()
        if substack.count == 0 {
            arrayOfStacks.removeLast()
        }
        return plateToReturn
    }
}


fileprivate class  SubstackOfPlates {
    var topnode: Plate?
    var count = 0
    
    func push(plate: Plate) {
        plate.next = topnode
        topnode = plate
        count += 1
    }
    
    func pop() -> Plate? {
        if let nodeToReturn = topnode{
            count -= 1
            topnode = topnode?.next
            return nodeToReturn
        } else {
            return nil
        }
    }
}

class Plate {
    var data: Int?
    var next: Plate?
    init(data: Int?) {
        self.data = data

    }
}
