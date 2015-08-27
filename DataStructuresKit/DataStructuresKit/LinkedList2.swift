//
//  LinkedList2.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 26/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class LinkedNode2<T:Equatable> {
    
    public var value : T
    public var next : LinkedNode2<T>? = nil
    public var prev : LinkedNode2<T>? = nil
    
    public init(value:T) {
        self.value = value
    }
}

public class LinkedList2<T:Equatable>: CustomStringConvertible {
    /*
    add(value)
    append(node)
    prepend(node)
    remove(node)
    (node) nodeAtPosition(index)
    replace(node, value)
    (bool)isEmpty
    (string)description
    */
    
    private(set) public var head : LinkedNode2<T>?
    private(set) public var tail : LinkedNode2<T>?
    private(set) public var length : Int = 0
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
        head = nil
        tail = nil
    }
    
    public func isEmpty() -> Bool {
        return length == 0
    }
    
    public func add(value : T) {
        append(LinkedNode2<T>(value: value))
    }
    
    public func append(node: LinkedNode2<T>) {
        tail?.next = node
        node.prev = tail
        tail = node
        
        if isEmpty() {
            head = node
        }
        
        length++
    }
    
    public func prepend(node: LinkedNode2<T>) {
        node.next = head
        head?.prev = node
        head = node
        
        if isEmpty() {
            tail = node
        }
        
        length++
    }
    
    public func remove(node: LinkedNode2<T>) {
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        if node === head {
            head = node.next
        }
        
        if node === tail {
            tail = node.prev
        }
        
        length--
    }
    
    public func removeHead() {
        if let h = head {
            self.remove(h)
        }
    }
    
    public func removeTail() {
        if let t = tail {
            self.remove(t)
        }
    }
    
    public func nodeAtPosition(index : Int) -> LinkedNode2<T>? {

        var n = head
        for var i=index; i>0; i-- {
            n = n?.next
        }
        
        return n
    }

}