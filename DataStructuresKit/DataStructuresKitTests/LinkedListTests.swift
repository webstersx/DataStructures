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

class LinkedNodesTests: XCTestCase {
    
    let ll = LinkedList<Int>()
    
    func testInitCreatesEmptyList() {
        XCTAssert(ll.length == 0, "a new linked list should be of length 0");
        XCTAssertNil(ll.head, "head of a new linked list should be nil");
        XCTAssertNil(ll.tail, "tail of a new linked list should be nil");

    }
    
    func testaddOneItem() {
        ll.add(1)
        XCTAssert(ll.length == 1, "after 1 add, list should be of length 1")
        XCTAssert(ll.head! === ll.tail!, "head should equal tail")
        XCTAssertNil(ll.tail!.next, "only item should not have a next")
    }
    
    func testaddTwoItems() {
        let one = 1
        let two = 2
        
        ll.add(one)
        ll.add(two)
        
        XCTAssert(ll.length == 2, "after 2 adds, list should be of length 2")
        XCTAssert(ll.head !== ll.tail, "first and second items should not be the same item")
        XCTAssert(ll.head!.value == one, "first item should be head")
        XCTAssert(ll.tail!.value == two, "second item should be tail")
        XCTAssert(ll.head!.next === ll.tail, "head.next should be tail")
        XCTAssert(ll.tail!.next == nil, "tail.next should be nil")
    }

    func testaddThreeItems() {
        
        let one = 1, two = 2, three = 3
        ll.add(one)
        ll.add(two)
        ll.add(three)
        
        XCTAssert(ll.length == 3, "after 3 adds, list should be of length 3")
        XCTAssert(ll.head!.value == one, "first item should be head")
        XCTAssert(ll.head!.next!.value == two, "second item should be after the first")
        XCTAssert(ll.head!.next!.next!.value == three, "the third item should be after the second")
        XCTAssert(ll.tail!.value == three, "the third item is also the tail")
        XCTAssertNil(ll.tail!.next, "the tail should not have a next item")
        
        print(ll)
    }

    
    //testremoveFirstZeroItems
    
    func testRemoveFirstZeroItems() {
        XCTAssertNil(ll.removeFirst(), "removing head from an empty list should return nil")
    }
    
    func testRemoveFirstOneItem() {
        let one = 1
        ll.add(one)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item at head")
        XCTAssertNil(ll.head, "after removing head on a list with one item, head should be nil")
        XCTAssertNil(ll.tail, "after removing head on a list with one item, tail should also be nil")
    }
    
    func testRemoveFirstTwoItems() {
        let one = 1
        let two = 2
        ll.add(one)
        ll.add(two)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item that was at head")
        XCTAssertEqual(ll.head!.value, two, "after removing head from a list of two items, head should now be the only other item")
        XCTAssertTrue(ll.head === ll.tail, "after removing head from a list of two items, head should now also be tail")
        XCTAssertNil(ll.head?.next, "after removing the first item in a linked list with 2 items, the remaining item should not have a next")
    }
    
    func testRemoveFirstThreeItems() {
        let one = 1
        let two = 2
        let three = 3
        ll.add(one)
        ll.add(two)
        ll.add(three)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item that was at head")
        XCTAssertEqual(ll.head!.value, two, "after removing head from a list of three items, head should now be the second item")
        XCTAssertEqual(ll.tail!.value, three, "after removing head from a list of three items, tail should still be the third item")
        XCTAssertTrue(ll.head !== ll.tail, "after removing head from a list of three items, head shoudl not be tail")
    }
    
    
    func testRemoveLast() {
        let one = 1
        let two = 2
        let three = 3
        
        ll.add(1)
        ll.add(2)
        ll.add(3)
        
        XCTAssertEqual(ll.head!.value, one, "the head item should be 1")
        XCTAssertEqual(ll.head!.next!.value, two, "the next item after 1 should be 2")
        XCTAssertEqual(ll.head!.next!.next!.value, three, "the next item after 2 should be 3")
        XCTAssertEqual(ll.tail!.value, three, "the next item after 2 should also be the tail of the list")
        
        //remove from 3
        var removed = ll.removeLast()
        XCTAssertNotNil(removed, "removing tail of a list with items should return something")
        XCTAssertEqual(removed!, three, "removing the tail of a list with three items should return the item that was at tail")
        XCTAssertEqual(ll.length, 2, "after removing tail of a list with three items, the length of the list should be 2")
        XCTAssertEqual(ll.tail!.value, two, "after removing tail of a list with three items, the new tail should be the second last item")
        
        //remove from 2
        removed = ll.removeLast()
        XCTAssertEqual(removed!, two, "removing the tail of a list with two items should return the item that was at the tail")
        XCTAssertEqual(ll.length, 1, "after removing tail of a list with two items, the length of the list should be 1")
        XCTAssertEqual(ll.tail!.value, one, "after removing tail of a list with two items, the new tail should be the first item in the list")
        XCTAssertTrue(ll.head === ll.tail, "after removing tail of a list with two items, the head and tail should refer to the same item")
        
        //remove from 1
        removed = ll.removeLast()
        XCTAssertEqual(removed!, one, "removing the tail of a list with one item should return the only item in the list")
        XCTAssertNil(ll.head, "after removing the tail of a list with one item, head should be nil")
        XCTAssertNil(ll.tail, "after removing the tail of a list with one item, tail should be nil")
        XCTAssertEqual(ll.length, 0, "after removing the tail of a list with one item, the length of the list should be 0")
        
        //remove from 0
        removed = ll.removeLast()
        XCTAssertNil(removed, "removing tail of a list with no items should return nil")
        
    }
    
    func testReverse() {
    
        ll.add(1)
        ll.add(2)
        ll.add(3)
        
        let lr = LinkedList<Int>()
        lr.add(3)
        lr.add(2)
        lr.add(1)
        
        let lrr = LinkedList<Int>()
        lrr.add(1)
        lrr.add(2)
        lrr.add(3)
        
        XCTAssertTrue(lrr == ll, "the ll and lrr should be equal as the reverse of a reverse is the original")
        XCTAssertTrue(ll != lr, "the lists ll and lr should not be equal")
        ll.reverse()
        XCTAssertTrue(ll == lr, "after reversing ll, ll and lr should now be equal")
        XCTAssertTrue(ll != lrr, "after revsering ll, ll and lrr should no longer be equal")
        ll.reverse()
        XCTAssertTrue(ll != lr, "after reversing ll again, it should no longer equal lr")
        XCTAssertTrue(ll == lrr, "after reversing ll again, it should return to its original state and equal lrr")
    }
}
