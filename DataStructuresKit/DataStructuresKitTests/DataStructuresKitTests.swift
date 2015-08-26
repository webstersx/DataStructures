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

class SinglyLinkedListsTests: XCTestCase {
    
    let ll = SinglyLinkedList<Int>()
    
    func testInitCreatesEmptyList() {
        XCTAssert(ll.size == 0, "a new linked list should be of size 0");
        XCTAssertNil(ll.head, "head of a new linked list should be nil");
        XCTAssertNil(ll.tail, "tail of a new linked list should be nil");

    }
    
    func testAppendOneItem() {
        ll.append(1)
        XCTAssert(ll.size == 1, "after 1 add, list should be of size 1")
        XCTAssert(ll.head! === ll.tail!, "head should equal tail")
        XCTAssertNil(ll.tail!.next, "only item should not have a next")
    }
    
    func testAppendTwoItems() {
        let one = 1
        let two = 2
        
        ll.append(one)
        ll.append(two)
        
        XCTAssert(ll.size == 2, "after 2 adds, list should be of size 2")
        XCTAssert(ll.head !== ll.tail, "first and second items should not be the same item")
        XCTAssert(ll.head!.value == one, "first item should be head")
        XCTAssert(ll.tail!.value == two, "second item should be tail")
        XCTAssert(ll.head!.next === ll.tail, "head.next should be tail")
        XCTAssert(ll.tail!.next == nil, "tail.next should be nil")
    }

    func testAppendThreeItems() {
        
        let one = 1, two = 2, three = 3
        ll.append(one)
        ll.append(two)
        ll.append(three)
        
        XCTAssert(ll.size == 3, "after 3 adds, list should be of size 3")
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
        ll.append(one)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item at head")
        XCTAssertNil(ll.head, "after removing head on a list with one item, head should be nil")
        XCTAssertNil(ll.tail, "after removing head on a list with one item, tail should also be nil")
    }
    
    func testRemoveFirstTwoItems() {
        let one = 1
        let two = 2
        ll.append(one)
        ll.append(two)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item that was at head")
        XCTAssertEqual(ll.head!.value, two, "after removing head from a list of two items, head should now be the only other item")
        XCTAssertTrue(ll.head === ll.tail, "after removing head from a list of two items, head should now also be tail")
        XCTAssertNil(ll.head?.next, "after removing the first item in a linked list with 2 items, the remaining item should not have a next")
    }
    
    func testRemoveFirstThreeItems() {
        let one = 1
        let two = 2
        let three = 3
        ll.append(one)
        ll.append(two)
        ll.append(three)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item that was at head")
        XCTAssertEqual(ll.head!.value, two, "after removing head from a list of three items, head should now be the second item")
        XCTAssertEqual(ll.tail!.value, three, "after removing head from a list of three items, tail should still be the third item")
        XCTAssertTrue(ll.head !== ll.tail, "after removing head from a list of three items, head shoudl not be tail")
    }
    
    
    func testRemoveLast() {
        let one = 1
        let two = 2
        let three = 3
        
        ll.append(1)
        ll.append(2)
        ll.append(3)
        
        XCTAssertEqual(ll.head!.value, one, "the head item should be 1")
        XCTAssertEqual(ll.head!.next!.value, two, "the next item after 1 should be 2")
        XCTAssertEqual(ll.head!.next!.next!.value, three, "the next item after 2 should be 3")
        XCTAssertEqual(ll.tail!.value, three, "the next item after 2 should also be the tail of the list")
        
        //remove from 3
        var removed = ll.removeLast()
        XCTAssertNotNil(removed, "removing tail of a list with items should return something")
        XCTAssertEqual(removed!, three, "removing the tail of a list with three items should return the item that was at tail")
        XCTAssertEqual(ll.size, 2, "after removing tail of a list with three items, the size of the list should be 2")
        XCTAssertEqual(ll.tail!.value, two, "after removing tail of a list with three items, the new tail should be the second last item")
        
        //remove from 2
        removed = ll.removeLast()
        XCTAssertEqual(removed!, two, "removing the tail of a list with two items should return the item that was at the tail")
        XCTAssertEqual(ll.size, 1, "after removing tail of a list with two items, the size of the list should be 1")
        XCTAssertEqual(ll.tail!.value, one, "after removing tail of a list with two items, the new tail should be the first item in the list")
        XCTAssertTrue(ll.head === ll.tail, "after removing tail of a list with two items, the head and tail should refer to the same item")
        
        //remove from 1
        removed = ll.removeLast()
        XCTAssertEqual(removed!, one, "removing the tail of a list with one item should return the only item in the list")
        XCTAssertNil(ll.head, "after removing the tail of a list with one item, head should be nil")
        XCTAssertNil(ll.tail, "after removing the tail of a list with one item, tail should be nil")
        XCTAssertEqual(ll.size, 0, "after removing the tail of a list with one item, the size of the list should be 0")
        
        //remove from 0
        removed = ll.removeLast()
        XCTAssertNil(removed, "removing tail of a list with no items should return nil")
        
    }
    
    func testReverse() {
    
        ll.append(1)
        ll.append(2)
        ll.append(3)
        
        let lr = SinglyLinkedList<Int>()
        lr.append(3)
        lr.append(2)
        lr.append(1)
        
        let lrr = SinglyLinkedList<Int>()
        lrr.append(1)
        lrr.append(2)
        lrr.append(3)
        
        XCTAssertTrue(lrr == ll, "the ll and lrr should be equal as the reverse of a reverse is the original")
        XCTAssertTrue(ll != lr, "the lists ll and lr should not be equal")
        ll.reverse()
        XCTAssertTrue(ll == lr, "after reversing ll, ll and lr should now be equal")
        XCTAssertTrue(ll != lrr, "after revsering ll, ll and lrr should no longer be equal")
        ll.reverse()
        XCTAssertTrue(ll != lr, "after reversing ll again, it should no longer equal lr")
        XCTAssertTrue(ll == lrr, "after reversing ll again, it should return to its original state and equal lrr")
    }
    
    //testremoveLast ^
    
//    func testremoveFirstZeroItems() {
//        let ll = SinglyLinkedList<Int>()
//        
//        let one = ll.add(1)
//        let two = ll.add(2)
//        
//        //test removing head from a list of size > 1
//        XCTAssert(ll.remove(one) === one, "removing an item in the list should return the item")
//        XCTAssert(ll.head === two, "removing the head of a list with more than 1 item should progress the head to the next item")
//        XCTAssert(ll.size == 1, "removing an item from the list should decrease its size by 1")
//        XCTAssert(ll.head === ll.tail, "the only item in the list should now be both head and tail")
//    }

//    func testremoveLast() {
//        let ll = SinglyLinkedList<Int>()
//        
//        
//        //test removing an item at tail
//        ll.add(1)
//        let two = ll.add(2)
//        let three = ll.add(3)
//        XCTAssert(ll.tail === three, "the last item in the list should be tail")
//        XCTAssert(ll.remove(three) === three, "removing an item from the list should return the item")
//        XCTAssert(ll.tail === two, "removing the tail of the list should move the tail to the item that precedes it")
//        XCTAssert(ll.size == 2, "removing an item from the list should reduce its size by 1")
//    }
//    
//    func testFind() {
//        let ll = SinglyLinkedList<Int>()
//        let i = ll.add(1)
//        let j = ll.add(2)
//        let k = ll.find(1)
//        
//        XCTAssertNotNil(j, "find should return an item")
//        XCTAssert(k! === i, "find should return the inserted item")
//        XCTAssert(k! !== j, "find should not return the item it wasn't looking for")
//    }
//    
//    func testContains() {
//        let ll = SinglyLinkedList<Int>()
//        ll.add(1)
//        XCTAssertTrue(ll.contains(1), "the list should contain the inserted item")
//        XCTAssertFalse(ll.contains(2), "the list should not contain an item that wasn't inserted")
//    }
}

class DoublyLinkedListsTests: XCTestCase {
    
    let ll = DoublyLinkedList<Int>()
    
    func testInitCreatesEmptyList() {
        XCTAssert(ll.size == 0, "a new linked list should be of size 0");
        XCTAssertNil(ll.head, "head of a new linked list should be nil");
        XCTAssertNil(ll.tail, "tail of a new linked list should be nil");
        
    }
    
    func testAppendOneItem() {
        ll.append(1)
        XCTAssert(ll.size == 1, "after 1 add, list should be of size 1")
        XCTAssert(ll.head === ll.tail, "head should equal tail")
        XCTAssertNil(ll.tail?.next, "only item should not have a next")
        XCTAssertNil(ll.head?.prev, "only item should not have a prev")
        
    }
    
    func testAppendTwoItems() {
        let one = 1
        let two = 2
        
        ll.append(one)
        ll.append(two)
        
        XCTAssert(ll.size == 2, "after 2 adds, list should be of size 2")
        XCTAssert(ll.head?.value == one, "first item should be head")
        XCTAssert(ll.tail?.value == two, "second item should be tail")
        XCTAssert(ll.head !== ll.tail, "first and second items should not be the same item")
        XCTAssert(ll.head?.next === ll.tail, "head.next should be tail")
        XCTAssert(ll.tail?.prev === ll.head, "tail.prev should be head")
        XCTAssertNil(ll.head?.prev, "head.prev should be nil")
        XCTAssertNil(ll.tail?.next, "tail.next should be nil")
    }
    
    func testAppendThreeItems() {
        
        let one = 1, two = 2, three = 3
        ll.append(one)
        ll.append(two)
        ll.append(three)
        
        XCTAssert(ll.size == 3, "after 3 adds, list should be of size 3")
        
        //test item values
        XCTAssert(ll.head?.value == one, "the first item should be 1")
        XCTAssert(ll.head?.next?.value == two, "the second item should be 2")
        XCTAssert(ll.head?.next?.next?.value == three, "the third item should be 3")
        
        //test item identities forwards and backwards
        XCTAssert(ll.head === ll.tail?.prev?.prev, "first is equal to third last")
        XCTAssert(ll.head?.next === ll.tail?.prev, "second is equal to second last")
        XCTAssert(ll.head?.next?.next === ll.tail, "third is equal to first last")
        
    }
    
    
    //testremoveFirstZeroItems
    
    func testRemoveFirstZeroItems() {
        XCTAssertNil(ll.removeFirst(), "removing head from an empty list should return nil")
    }
    
    func testRemoveFirstOneItem() {
        let one = 1
        ll.append(one)
        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item at head")
        XCTAssertNil(ll.head, "after removing head on a list with one item, head should be nil")
        XCTAssertNil(ll.tail, "after removing head on a list with one item, tail should also be nil")
    }
    
    func testRemoveFirstTwoItems() {
        ll.append(1)
        ll.append(2)
        XCTAssertEqual(1, ll.removeFirst()!, "the item removed from head should be the same as the item that was at head")
        XCTAssertEqual(ll.head!.value, 2, "after removing head from a list of two items, head should now be the only other item")
        XCTAssertTrue(ll.head === ll.tail, "after removing head from a list of two items, head should now also be tail")
        XCTAssertNil(ll.head?.prev, "after removing the head of linked list, the new head should not have a prev")
        XCTAssertNil(ll.head?.next, "after removing the 1 item from a linked list with 2 items, the remaining item should not have a next")
    }
//    
//    func testRemoveFirstThreeItems() {
//        let one = 1
//        let two = 2
//        let three = 3
//        ll.append(one)
//        ll.append(two)
//        ll.append(three)
//        XCTAssertEqual(one, ll.removeFirst()!, "the item removed from head should be the same as the item that was at head")
//        XCTAssertEqual(ll.head!.value, two, "after removing head from a list of three items, head should now be the second item")
//        XCTAssertEqual(ll.tail!.value, three, "after removing head from a list of three items, tail should still be the third item")
//        XCTAssertTrue(ll.head !== ll.tail, "after removing head from a list of three items, head shoudl not be tail")
//    }
    
    
//    func testRemoveLast() {
//        let one = 1
//        let two = 2
//        let three = 3
//        
//        ll.append(1)
//        ll.append(2)
//        ll.append(3)
//        
//        XCTAssertEqual(ll.head!.value, one, "the head item should be 1")
//        XCTAssertEqual(ll.head!.next!.value, two, "the next item after 1 should be 2")
//        XCTAssertEqual(ll.head!.next!.next!.value, three, "the next item after 2 should be 3")
//        XCTAssertEqual(ll.tail!.value, three, "the next item after 2 should also be the tail of the list")
//        
//        //remove from 3
//        var removed = ll.removeLast()
//        XCTAssertNotNil(removed, "removing tail of a list with items should return something")
//        XCTAssertEqual(removed!, three, "removing the tail of a list with three items should return the item that was at tail")
//        XCTAssertEqual(ll.size, 2, "after removing tail of a list with three items, the size of the list should be 2")
//        XCTAssertEqual(ll.tail!.value, two, "after removing tail of a list with three items, the new tail should be the second last item")
//        
//        //remove from 2
//        removed = ll.removeLast()
//        XCTAssertEqual(removed!, two, "removing the tail of a list with two items should return the item that was at the tail")
//        XCTAssertEqual(ll.size, 1, "after removing tail of a list with two items, the size of the list should be 1")
//        XCTAssertEqual(ll.tail!.value, one, "after removing tail of a list with two items, the new tail should be the first item in the list")
//        XCTAssertTrue(ll.head === ll.tail, "after removing tail of a list with two items, the head and tail should refer to the same item")
//        
//        //remove from 1
//        removed = ll.removeLast()
//        XCTAssertEqual(removed!, one, "removing the tail of a list with one item should return the only item in the list")
//        XCTAssertNil(ll.head, "after removing the tail of a list with one item, head should be nil")
//        XCTAssertNil(ll.tail, "after removing the tail of a list with one item, tail should be nil")
//        XCTAssertEqual(ll.size, 0, "after removing the tail of a list with one item, the size of the list should be 0")
//        
//        //remove from 0
//        removed = ll.removeLast()
//        XCTAssertNil(removed, "removing tail of a list with no items should return nil")
//        
//    }
    
//    func testReverse() {
//        
//        ll.append(1)
//        ll.append(2)
//        ll.append(3)
//        
//        let lr = DoublyLinkedList<Int>()
//        lr.append(3)
//        lr.append(2)
//        lr.append(1)
//        
//        let lrr = DoublyLinkedList<Int>()
//        lrr.append(1)
//        lrr.append(2)
//        lrr.append(3)
//        
//        XCTAssertTrue(lrr == ll, "the ll and lrr should be equal as the reverse of a reverse is the original")
//        XCTAssertTrue(ll != lr, "the lists ll and lr should not be equal")
//        ll.reverse()
//        XCTAssertTrue(ll == lr, "after reversing ll, ll and lr should now be equal")
//        XCTAssertTrue(ll != lrr, "after revsering ll, ll and lrr should no longer be equal")
//        ll.reverse()
//        XCTAssertTrue(ll != lr, "after reversing ll again, it should no longer equal lr")
//        XCTAssertTrue(ll == lrr, "after reversing ll again, it should return to its original state and equal lrr")
//    }
}

