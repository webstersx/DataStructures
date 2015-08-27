//
//  LinkedNode.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 24/06/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class LinkedNode<T:Equatable> {
    
    public var value : T
    public var next : LinkedNode<T>? = nil
    
    public init(value:T) {
        self.value = value
    }
}

public class LinkedList<T:Equatable>: CustomStringConvertible {
    
    /*
    Properties
    .value
    .next?
    .length
    
    Functions
    add(value)
    append(node)
    prepend(node)
    remove(node)
    (node) nodeAtPosition(index)
    replace(node, value)
    (bool)isEmpty
    (string)description
    */
    
    private(set) public var head : LinkedNode<T>? = nil
    private(set) public var tail : LinkedNode<T>? = nil
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
    }
    
    public func isEmpty() -> Bool {
        return length == 0
    }
    
    /**
        Add a value to the end of the linked list - O(1)
    */
    
    public func add(value:T) {
        let item = LinkedNode<T>(value: value)
        append(item)
    }
    
    /**
    Add a value to the end of a linked list - O(1)
    */
    public func append(node:LinkedNode<T>) {

        if self.isEmpty() {
            head = node
        } else {
            tail?.next = node
        }
        
        tail = node
        length++
    }
    
    /**
    Add a node to the front of the linked list - O(1)
    */
    public func prepend(node:LinkedNode<T>) {
        
        if self.isEmpty() {
            tail = node
        } else {
            node.next = head
        }
        
        head = node
        length++
    }
    
    /**
        Remove a specific node in the list - O(n)
    */
    
    public func remove(node: LinkedNode<T>) {
        
        //nothing in the list
        if self.isEmpty() {
            return
        } else if node === head {
            
            //removing the only node
            if head === tail {
                head = nil
                tail = nil
            } else {
                //removing the head node
                head = head?.next
            }
        } else {
            //start at head
            var n = head
            
            //position us just before node
            while n?.next !== node {
                n = n?.next
                
                //if we reached the end and didn't find the node
                if n == nil {
                    return
                }
            }
            
            //move n.next past node
            n?.next = node.next
            
            //if node was tail, set n as tail
            if node === tail {
                tail = n
            }
        }
        
    }
    
    /**
        Remove and return the value stored at the head of the linked list - O(1)
    */
    public func removeFirst() -> T? {
        
        //if we have a head
        if let h = head {
            
            //move head
            head = h.next
            
            //if its also tail, we're removing the only item
            if (h === tail) {
                tail = nil
            }
            
            //reduce length
            length--
            
            //return the value
            return h.value
        }

        return nil
    }
    
    /** 
        Remove and return the tail of the list - O(n)
    */
    public func removeLast() -> T? {
        
        //if there are items
        if let h = head, t = tail {
            if (h === t) {
                head = nil
                tail = nil
            } else {
                //start at head
                var n : LinkedNode<T>? = h
                
                //progress through the list until we're just before tail
                while (n?.next !== t) {
                    n = n?.next
                }
                
                //remove link to current tail
                n?.next = nil
                
                //make this new tail
                tail = n
            }
            
            length--
            
            return t.value
            
        }
        
        return nil
    }
    
    /**
        Reverse the order of the nodes in the list - O(n)
    */
    public func reverse() {
        //nothing to do
        if !self.isEmpty() {
            if head === tail {
                //swap them
                head?.next = nil
                tail?.next = head
                head = tail
                tail = head?.next
            } else {
                var n = head
                
                while n !== tail {
                    
                    //get this nodes next (so we can move to it next)
                    let m = n?.next
                    
                    //set this nodes next to node right behind tail
                    n?.next = tail?.next
                    
                    //point tail to this node
                    tail?.next = n
                    
                    //move to the node this used to point to
                    n = m
                }
                
                let t = head
                head = tail
                tail = t
                
            }
        }
    }
}

//public class DoublyLinkedList<T:Equatable>: LinkedNode<T> {
//    
//    override public init() {
//        super.init()
//    }
//    
//    override public func append(value: T) {
//        //capture the current tail if it exists
//        let t = tail
//        super.append(value)
//        
//        if let _ = t {
//            tail?.prev = t
//        }
//    }
//    
//    override public func prepend(value: T) {
//        super.prepend(value)
//        
//        if let _ = head?.next {
//            head?.next?.prev = head
//        }
//    }
//    
//    override public func removeFirst() -> T? {
//        
//        if let f = super.removeFirst() {
//            head?.prev = nil
//            return f
//        }
//        
//        return nil
//    }
//    
//    override public func removeLast() -> T? {
//        
//        if let l = tail {
//            
//            tail = l.prev
//            
//            if (tail == nil) {
//                head = nil
//            }
//        }
//        
//        return nil
//    }
//    
//    override public func reverse() {
//        var n = head
//        
//        while (n != nil) {
//            let p = n?.prev
//            n?.prev = n?.next
//            n?.next = p
//            
//            n = n?.prev
//        }
//    }
//}


/**
    List equality - O(n)
*/
public func ==<T:Equatable>(list1: LinkedList<T>, list2:LinkedList<T>) -> Bool {
    
    if list1.length != list2.length {
        return false
    }
    
    var i = list1.head
    var j = list2.head

    
    while (i != nil && j != nil) {
        
        if i?.value != j?.value {
            return false
        }
        
        i = i?.next
        j = j?.next
    }
    
    return true
}

/**
    List inequality - O(n)
*/
public func !=<T:Equatable>(list1: LinkedList<T>, list2:LinkedList<T>) -> Bool {
    return !(list1 == list2)
}


/**
    Node equality - O(n)
*/
public func ==<T:Equatable>(node1: LinkedNode<T>, node2:LinkedNode<T>) -> Bool {
    return node1.value == node2.value
}


/**
    Node inequality - O(n)
*/
public func !=<T:Equatable>(node1: LinkedNode<T>, node2:LinkedNode<T>) -> Bool {
    return !(node1==node2)
}

