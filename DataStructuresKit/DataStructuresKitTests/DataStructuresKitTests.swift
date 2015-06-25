//
//  DataStructuresKitTests.swift
//  DataStructuresKitTests
//
//  Created by Shawn Webster on 24/06/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import XCTest
import DataStructuresKit

class DataStructuresKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}

class LinkedListsTests: XCTestCase {
    
    func testInitCreatesEmptyList() {
        let ll = LinkedList<Int>()

        XCTAssert(ll.size() == 0, "a new linked list should be of size 0");
        XCTAssertNil(ll.head, "head of a new linked list should be nil");
        XCTAssertNil(ll.tail, "tail of a new linked list should be nil");

    }
    
    func testAddOneItem() {
        let ll = LinkedList<Int>()
        
        let item = ll.add(1)
        XCTAssert(ll.size() == 1, "after 1 add, list should be of size 1")
        XCTAssert(item === ll.head!, "only item inserted should be head")
        XCTAssert(item === ll.tail!, "only item inserted should be tail")
        XCTAssert(ll.head! === ll.tail!, "head should equal tail")
        XCTAssertNil(ll.head!.prev, "only item should not have a prev")
        XCTAssertNil(ll.tail!.next, "only item should not have a next")
        
    }
    
    func testAddTwoItems() {
        let ll = LinkedList<Int>()
        
        let head = ll.add(1)
        let tail = ll.add(2)
        
        XCTAssert(ll.size() == 2, "after 2 adds, list should be of size 2")
        XCTAssert(head !== tail, "first and second items should not be the same item")
        XCTAssert(head === ll.head!, "first item should be head")
        XCTAssert(tail === ll.tail!, "second item should be tail")
        XCTAssert(head.next! === tail, "head.next should be tail")
        XCTAssert(tail.prev! === head, "tail.prev should be head")
    }
    
    func testAddThreeItems() {
        let ll = LinkedList<Int>()
        
        let head = ll.add(1)
        let middle = ll.add(2)
        let tail = ll.add(3)
        
        XCTAssert(ll.size() == 3, "after 3 adds, list should be of size 3")
        XCTAssert(head === ll.head!, "first item should be head")
        XCTAssert(tail === ll.tail!, "second item should be tail")
        XCTAssert(head.next! === middle, "head.next should be m")
        XCTAssert(tail.prev! === middle, "tail.prev should be m")
        XCTAssert(middle.prev === head, "m.prev should be h")
        XCTAssert(middle.next === tail, "m.next should be t")
    }
    
    func testFind() {
        let ll = LinkedList<Int>()
        let i = ll.add(1)
        let j = ll.add(2)
        let k = ll.find(1)
        
        XCTAssertNotNil(j, "find should return an item")
        XCTAssert(k! === i, "find should return the inserted item")
        XCTAssert(k! !== j, "find should not return the item it wasn't looking for")
    }
    
    func testContains() {
        let ll = LinkedList<Int>()
        ll.add(1)
        XCTAssertTrue(ll.contains(1), "the list should contain the inserted item")
        XCTAssertFalse(ll.contains(2), "the list should not contain an item that wasn't inserted")
    }
}