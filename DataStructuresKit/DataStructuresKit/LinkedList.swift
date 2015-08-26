//
//  SinglyLinkedList.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 24/06/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class LinkedNode<T:Equatable> {
    
    public var value : T
    public var next : LinkedNode<T>? = nil
    public var prev : LinkedNode<T>? = nil
    
    public init(value:T) {
        self.value = value
    }
}

public class SinglyLinkedList<T:Equatable>: CustomStringConvertible {
    
    private(set) public var head : LinkedNode<T>? = nil
    private(set) public var tail : LinkedNode<T>? = nil
    private(set) public var size : Int = 0
    public var description : String {
        
        var d : String = ""
        
        if let n = head {
            
            d += "\(n.value)"
            
            var m = n.next
            
            while (m != nil) {
                d += " -> \(m!.value)"
                m = m!.next
            }
            
        } else {
            d = "[ empty ]"
        }

        return d
        
    }
    
    public init() {
    }
    
    /**
    Add a value to the end of a linked list - O(1)
    */
    public func append(value:T) -> Void {
        
        let item = LinkedNode<T>(value: value)

        //if this is the first item
        if tail == nil {
            head = item
        } else {
            //move tail to the new item
            tail!.next = item
        }

        tail = item
        size++
    }
    
    /**
    Add a value to the front of the linked list - O(1)
    */
    public func prepend(value:T) -> Void {
        
        //create a new node
        let item = LinkedNode<T>(value:value)
        item.next = head
        
        //if this is the first node
        if (head == nil) {
            tail = item
        } else {
            item.next = head
        }
        
        
        head = item
        size++
    }
    
    /**
    Remove and return the value stored at the head of the linked list - O(1)
    */
    public func removeFirst() -> T? {
        
        //if
        if let h = head, t : T = h.value {
            head = h.next
            
            if (head == nil) {
                tail = nil
            }
            
            size--
            
            return t
        }

        return nil
    }
    
    /** 
    Remove and return the tail of the list - O(n)
    */
    public func removeLast() -> T? {
        
        //1, 2+
        
        //if there are items
        if let h = head, t = tail {
            if (h === t) {
                head = nil
                tail = nil
            } else {
                //start at head
                var n : LinkedNode<T>? = h
                
                //progress through the list until we're just before tail
                while (n!.next !== t) {
                    n = n!.next
                }
                
                //move tail to the next-to-last node
                tail = n!
                tail!.next = nil
            }
            
            size--
            
            return t.value
            
        }
        
        return nil
    }
    
    public func reverse() {
        //keep a cursor at tail, start a runner at head moving the element between tail and nil, repeat until we reach tail, then swap head and tail
        
        //if head and tail exist
        if let h = head, t = tail {
            
            //if head and tail aren't the same
            if (h !== t) {
                
                //start at head
                var n = h
                
                //do this until we reach tail
                while (n !== t) {
                    
                    //capture what the current node used to point to as its next
                    let m = n.next!
                    
                    //set it to what tail currently points to as its next
                    n.next = t.next
                    
                    //set tail to point to this node
                    t.next = n
                    
                    //move the current node to what this used to point to
                    n = m
                }
                
                //swap head and tail
                n = head!
                head = tail
                tail = n
                
            }
        }
    }
}

public class DoublyLinkedList<T:Equatable>: SinglyLinkedList<T> {
    
    override public init() {
        super.init()
    }
    
    override public func append(value: T) {
        //capture the current tail if it exists
        let t = tail
        super.append(value)
        
        if let _ = t {
            tail?.prev = t
        }
    }
    
    override public func prepend(value: T) {
        super.prepend(value)
        
        if let _ = head?.next {
            head?.next?.prev = head
        }
    }
    
    override public func removeFirst() -> T? {
        
        if let f = super.removeFirst() {
            head?.prev = nil
            return f
        }
        
        return nil
    }
    
    override public func removeLast() -> T? {
        
        if let l = tail {
            
            tail = l.prev
            
            if (tail == nil) {
                head = nil
            }
        }
        
        return nil
    }
    
    override public func reverse() {
        var n = head
        
        while (n != nil) {
            let p = n?.prev
            n?.prev = n?.next
            n?.next = p
            
            n = n?.prev
        }
    }
}

/**
Test whether two linked lists containing items of the same type have all the same values in the same order
*/
public func ==<T:Equatable>(list1: SinglyLinkedList<T>, list2:SinglyLinkedList<T>) -> Bool {
    
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

public func !=<T:Equatable>(list1: SinglyLinkedList<T>, list2:SinglyLinkedList<T>) -> Bool {
    return !(list1==list2)
}

/**
Two lists containing different types of items are not equal
*/
public func ==<T,U>(list1: SinglyLinkedList<T>, list2:SinglyLinkedList<U>) -> Bool {
    return false
}


