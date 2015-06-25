//
//  LinkedList.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 24/06/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class LinkedListItem<T:Equatable> {
    
    public var object : T
    public var next : LinkedListItem<T>?
    public var prev : LinkedListItem<T>?
    
    public init(object:T) {
        self.object = object
    }
}

public func ==<T:Equatable>(item1: LinkedListItem<T>, item2: LinkedListItem<T>) -> Bool {
    return item1.object == item2.object
}

public func ==<T,U>(item1: LinkedListItem<T>, item2:LinkedListItem<U>) -> Bool {
    return false
}

public class LinkedList<T:Equatable> {
    
    private(set) public var head : LinkedListItem<T>?
    private(set) public var tail : LinkedListItem<T>?
    private(set) public var size : Int = 0
    
    /* suggested API functions
    - findNext(item)
    - promote(item)
    - demote(item)
    - moveToHead
    - moveToTail
    - remove
    - equals
    */
    
    public init() {
        head = nil
        tail = nil
    }
    
    public func add(object:T) -> LinkedListItem<T> {
        let item = LinkedListItem<T>(object: object);
        
        //first item
        if tail == nil {
            tail = item
            head = tail
        } else {
            //move tail
            item.prev = tail
            tail!.next = item
            tail = item
        }
        
        size++
        
        return item
    }
    
    public func find(object:T) -> LinkedListItem<T>? {
        
        for var item = head; item != nil; item = item!.next {
            if item!.object == object {
                return item
            }
        }
        
        return nil;
    }
    
    public func contains(object:T) -> Bool {
        return find(object) != nil
    }
}

public func ==<T:Equatable>(list1: LinkedList<T>, list2:LinkedList<T>) -> Bool {
    
    if list1.size != list2.size {
        return false
    }
    
    for var i=list1.head, j=list2.head; i != nil && j != nil; i=i?.next, j=j?.next {
        if i?.object != j?.object {
            return false
        }
    }
    
    return true
}

public func ==<T,U>(list1: LinkedList<T>, list2:LinkedList<U>) -> Bool {
    return false
}


