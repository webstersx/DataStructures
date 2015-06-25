//: Playground - noun: a place where people can play

import UIKit

import DataStructuresKit

/* //Link Lists
var ll = LinkedList()
ll.size()
ll.head
ll.tail

ll.find(1)
ll.contains(1)
ll.add(1)
ll.size()
ll.find(1)
ll.contains(1)

ll.head
ll.tail

ll.add(2)
ll.size()

ll.head
ll.tail
ll.head?.next
ll.tail?.prev
*/

let i1 = LinkedListItem<Int>(object: 1)
let i2 = LinkedListItem<Int>(object: 2)
i1.next = i2
i2.prev = i1

i1.object
i2.object
i1.next?.prev?.next?.object

let ll = LinkedList<Int>()
let first = ll.add(1)
let second = ll.add(1)

first
second

first == second
first === second
first.object == second.object


let firstFound = ll.find(1)!

first == firstFound
first === firstFound
second == firstFound
second === firstFound


ll.head?.object
ll.tail?.object
ll.find(1)?.object
ll.find(2)?.object
ll.contains(1)
ll.contains(2)

ll.size
let lll = LinkedList<Int>()

ll == lll
ll === lll

let a = LinkedList<Int>()
let b = LinkedList<Int>()

a.add(1)
b.add(1)

a == b
a.add(2)
a == b
b.add(2)
a == b

let c = LinkedList<String>()

a == c








