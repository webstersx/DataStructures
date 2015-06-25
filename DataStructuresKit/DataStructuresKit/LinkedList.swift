//
//  LinkedList.swift
//  DataStructuresKit
//
//  Created by Shawn Webster on 24/06/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

public class Item : DebugPrintable, Printable {
    
    public var object : AnyObject
    public var next : Item?
    public var prev : Item?
    
    public init(object:AnyObject) {
        self.object = object
    }
    
    public var debugDescription : String {
        return "\(object)"
    }
    
    public var description : String {
        return debugDescription
    }
}

public class LinkedList {
    
    public var head : Item?
    public var tail : Item?
    var length : Int = 0
    
    public init() {
        head = nil
        tail = nil
    }
    
    public func add(object:AnyObject) -> Item {
        let item = Item(object: object);
        
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
        
        length++
        
        return item
    }
    
    public func find(object:AnyObject) -> Item? {
        
        var foundItem : Item?
        
        for var item = head; item != nil; item = item!.next {
            if item!.object.isEqual(object) {
                return item
            }
            
        }
        
        return nil;
    }
    
    public func contains(object:AnyObject) -> Bool {
        return find(object) != nil
    }
    
    public func size() -> Int {
        return length
    }
    
    
}