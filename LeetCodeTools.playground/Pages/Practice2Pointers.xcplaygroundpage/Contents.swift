//: [Previous](@previous)
import Foundation
/*:
 # 2 Pointers
*/
/*:
 -------------------------------------------------------------------
 ## [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list)
 Given the head of a linked list, remove the nth node from the end of the list and return its head.
 ### Example 1:
 - __Input:__ head = [1,2,3,4,5], n = 2
 - __Output:__ [1,2,3,5]
 */
class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var beforeHead = ListNode(0, head)
        var runner: ListNode? = beforeHead
        var prev: ListNode? = beforeHead

        // Space runner 'n' away from prev
        for _ in 0...n {
            runner = runner?.next
        }

        // Iterate until runner is at the end
        while runner != nil {
            runner = runner?.next
            prev = prev?.next
        }

        // Remove the node after prev
        prev?.next = prev?.next?.next

        return beforeHead.next
    }
}
/*:
 -------------------------------------------------------------------
 ## [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists)
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
 Merge all the linked-lists into one sorted linked-list and return it.
 ### Example 1:
 - __Input:__ lists = [[1,4,5],[1,3,4],[2,6]]
 - __Output:__ [1,1,2,3,4,4,5,6]
 * __Explanation:__ The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 */
class Solution23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var beforeHead = ListNode(0)
        var tail: ListNode? = beforeHead
        var heap = Heap<ListNode> { $0.val < $1.val }

        // populate heap with the head of each list
        for node in lists {
            if let node {
                heap.insert(node)
            }
        }

        // populate list
        while !heap.isEmpty {
            let head = heap.remove()
            tail?.next = head
            tail = head

            // add the next node of the now removed head of the list
            if let nextNode = tail?.next { heap.insert(nextNode) }
        }

        return beforeHead.next
    }
}

// I guess learn to create a heap on the fly 😕
struct Heap<T> {
    var elements: [T]
    let priorityFunction: (T, T) -> Bool

    init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction

        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }

    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }

    func peek() -> T? {
        return elements.first
    }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    mutating func remove() -> T? {
        guard !isEmpty else { return nil }

        elements.swapAt(0, count - 1)
        let item = elements.removeLast()
        siftDown(from: 0)

        return item
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = self.parent(of: child)

        while child > 0 && priorityFunction(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = self.parent(of: child)
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index

        while true {
            let left = self.leftChild(of: parent)
            let right = left + 1
            var candidate = parent

            if left < count && priorityFunction(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && priorityFunction(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }

            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }

    private func parent(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChild(of index: Int) -> Int {
        return 2 * index + 1
    }
}
//: [Next](@next)
