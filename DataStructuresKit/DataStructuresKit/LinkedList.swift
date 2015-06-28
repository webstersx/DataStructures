//
//  LinkedList.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 24/06/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class LinkedItem<T:Equatable> {
    
    public var value : T
    public var next : LinkedItem<T>?
    
    public init(value:T) {
        self.value = value
    }

}

public func ==<T:Equatable>(item1: LinkedItem<T>, item2: LinkedItem<T>) -> Bool {
    return item1.value == item2.value
}

public func ==<T,U>(item1: LinkedItem<T>, item2:LinkedItem<U>) -> Bool {
    return false
}

public class LinkedList<T:Equatable> {
    
    private(set) public var head : LinkedItem<T>?
    private(set) public var tail : LinkedItem<T>?
    private(set) public var size : Int = 0
    
    public init() {
        head = nil
        tail = nil
    }
    
    /**
    Add a value to the linked list at position 'tail' - O(1)
    */
    public func add(value:T) -> LinkedItem<T> {
        let item = LinkedItem<T>(value: value);
        
        //first item
        if tail == nil {
            tail = item
            head = tail
        } else {
            //move tail
            tail!.next = item
            tail = item
        }
        
        size++
        
        return item
    }
    
    /**
    Remove an item from the linked list
    */
    public func remove(item: LinkedItem<T>) -> LinkedItem<T>? {
        if size == 0 {
            return nil
        } else if size == 1 && item == head! {
            head = nil
            tail = nil
            size--
            return item
        } else if item == head! {
            head = head?.next
            size--
            return item
        } else {
            var i = head;
            var j = head?.next
            
            while (j != nil) {
                if j! == item {
                    if (j! == tail!) {
                        tail = i
                    }
                    
                    i?.next = j?.next
                    size--
                    return j!
                }
                
                i = j
                j = j?.next
            }
        }
        
        return nil
    }
    
    /**
    Find a value in the linked list
    
    O(n)
    */
    public func find(value:T) -> LinkedItem<T>? {
        
        for var item = head; item != nil; item = item!.next {
            if item!.value == value {
                return item
            }
        }
        
        return nil;
    }
    
    /**
    Specify whether a value is in the linked list
    
    O(n)
    
    See also: find(value:T)
    */
    public func contains(value:T) -> Bool {
        return find(value) != nil
    }
}

public func ==<T:Equatable>(list1: LinkedList<T>, list2:LinkedList<T>) -> Bool {
    
    if list1.size != list2.size {
        return false
    }
    
    for var i=list1.head, j=list2.head; i != nil && j != nil; i=i?.next, j=j?.next {
        if i?.value != j?.value {
            return false
        }
    }
    
    return true
}

public func ==<T,U>(list1: LinkedList<T>, list2:LinkedList<U>) -> Bool {
    return false
}


