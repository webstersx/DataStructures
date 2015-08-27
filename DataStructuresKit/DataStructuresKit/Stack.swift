//
//  Stack.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 26/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class Stack<T:Equatable> {
    
    private let list = LinkedList<T>()
    
    public init() {
        
    }
    
    public func push(value: T) {
        list.prepend(LinkedNode<T>(value: value))
    }
    
    public func pop() -> T? {
        return list.removeFirst()
    }

    public func peek() -> T? {
        return list.head?.value
    }
    
    public func isEmpty() -> Bool {
        return list.isEmpty()
    }
    

}