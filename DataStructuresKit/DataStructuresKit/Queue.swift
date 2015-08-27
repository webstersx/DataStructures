//
//  Queue.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 26/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class Queue<T:Equatable> {
    
    private let list = LinkedList<T>()
    
    public init() {
        
    }
    
    public func enqueue(value: T) {
        list.add(value)
    }
    
    public func dequeue() -> T? {
        return list.removeFirst()
    }
    
    public func peek() -> T? {
        return list.head?.value
    }
    
    public func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    
}