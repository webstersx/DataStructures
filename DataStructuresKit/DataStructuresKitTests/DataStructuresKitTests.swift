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

        XCTAssert(ll.size == 0, "a new linked list should be of size 0");
        XCTAssertNil(ll.head, "head of a new linked list should be nil");
        XCTAssertNil(ll.tail, "tail of a new linked list should be nil");

    }
    
    func testAddOneItem() {
        let ll = LinkedList<Int>()
        
        let item = ll.add(1)
        XCTAssert(ll.size == 1, "after 1 add, list should be of size 1")
        XCTAssert(item === ll.head!, "only item inserted should be head")
        XCTAssert(item === ll.tail!, "only item inserted should be tail")
        XCTAssert(ll.head! === ll.tail!, "head should equal tail")
        XCTAssertNil(ll.tail!.next, "only item should not have a next")
        
    }
    
    func testAddTwoItems() {
        let ll = LinkedList<Int>()
        
        let head = ll.add(1)
        let tail = ll.add(2)
        
        XCTAssert(ll.size == 2, "after 2 adds, list should be of size 2")
        XCTAssert(head !== tail, "first and second items should not be the same item")
        XCTAssert(head === ll.head!, "first item should be head")
        XCTAssert(tail === ll.tail!, "second item should be tail")
        XCTAssert(head.next! === tail, "head.next should be tail")
        XCTAssert(tail.next == nil, "tail.next should be nil")
    }
    
    func testAddThreeItems() {
        let ll = LinkedList<Int>()
        
        let head = ll.add(1)
        let middle = ll.add(2)
        let tail = ll.add(3)
        
        XCTAssert(ll.size == 3, "after 3 adds, list should be of size 3")
        XCTAssert(head === ll.head!, "first item should be head")
        XCTAssert(tail === ll.tail!, "second item should be tail")
        XCTAssert(head.next! === middle, "head.next should be middle")
        XCTAssert(middle.next === tail, "middle.next should be tail")
        XCTAssert(tail.next == nil, "tail.next should be nil");
    }
    
    func testRemoveNothing() {
        let ll = LinkedList<Int>()
        
        let notRemoved = ll.remove(LinkedItem<Int>(value:0))
        XCTAssertNil(notRemoved, "an item that was not in the list should not be removed")
    }
    
    func testRemoveOnlyItem() {
        let ll = LinkedList<Int>()
        
        let one = ll.add(1)
        XCTAssert(ll.remove(one) === one, "removing an item in the list should return the item")
        XCTAssertNil(ll.head, "removing the only item in the list should nil head")
        XCTAssertNil(ll.tail, "removing the only item in the list should nil tail")
        XCTAssert(ll.size == 0, "removing the only item in the list should return the list to size zero")
    }
    
    func testRemoveHeadOfListSizedTwo() {
        let ll = LinkedList<Int>()
        
        let one = ll.add(1)
        let two = ll.add(2)
        
        //test removing head from a list of size > 1
        XCTAssert(ll.remove(one) === one, "removing an item in the list should return the item")
        XCTAssert(ll.head === two, "removing the head of a list with more than 1 item should progress the head to the next item")
        XCTAssert(ll.size == 1, "removing an item from the list should decrease its size by 1")
        XCTAssert(ll.head === ll.tail, "the only item in the list should now be both head and tail")
    }
    
    func testRemoveMiddle() {
        let ll = LinkedList<Int>()
        
        //test removing an item that links to another item
        ll.add(1)
        let two = ll.add(2)
        let three = ll.add(3)
        
        XCTAssert(ll.head?.next === two, "the second item in the list is pointed to by head.next")
        XCTAssert(ll.remove(two) === two, "removing an item in the list should return the item")
        XCTAssert(ll.head?.next === three, "the second item in the list after removal should point to a different item")
        XCTAssert(ll.size == 2, "removing an item from the list should decrease its size by 1")
    }
    
    func testRemoveTail() {
        let ll = LinkedList<Int>()
        
        
        //test removing an item at tail
        ll.add(1)
        let two = ll.add(2)
        let three = ll.add(3)
        XCTAssert(ll.tail === three, "the last item in the list should be tail")
        XCTAssert(ll.remove(three) === three, "removing an item from the list should return the item")
        XCTAssert(ll.tail === two, "removing the tail of the list should move the tail to the item that precedes it")
        XCTAssert(ll.size == 2, "removing an item from the list should reduce its size by 1")
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