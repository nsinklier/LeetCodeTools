//: [Previous](@previous)
import Foundation
//: # Helpful Code Snippets
//: ## Integer Extensions
//: Creates an array of the digits in a given array
extension Int {
    var digits: [Int] {
        String(self).compactMap { Int(String($0)) }
    }
}
/*:
 --------------------------------------------------------------
 ## String Extensions
 Returns the Character of a given index of a String as a String
 - Note: This is slower than creating an array of the characters of a String `Array(myString)`, but does not increase space complexity
 */
extension String {
    func at(_ index: Int) -> String {
        guard index < count else { return "" }
        let strIndex = self.index(startIndex, offsetBy: index)
        return String(self[strIndex])
    }
}
//: Returns a substring of a given String using the given indices
extension String {
    func substring(from start: Int, to end: Int) -> String {
        guard start < end else { return "" }
        let startIndex = self.index(startIndex, offsetBy: start)
        let endIndex = self.index(startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }
}
//: Returns an array of lowercased alphanumeric Characters of the String
extension String {
    func alphanumericArray() -> [Character] {
        var chars = Array(self.lowercased())
        chars.removeAll { !$0.isLetter && !$0.isNumber }
        return chars
    }
}
/*:
 --------------------------------------------------------------
 ## Array Extensions
 Prepends the elements of the given array to the existing array
 */
extension Array {
    mutating func prepend(contentsOf newElements: [Element]) {
        var prepended = newElements
        prepended.append(contentsOf: self)
        self = prepended
    }
}
/*:
 --------------------------------------------------------------
 ## Binary Tree
 */
class TreeNode {
    let val: Int
    let left: TreeNode?
    let right: TreeNode?
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
/*:
 --------------------------------------------------------------
 ## BFS Binary Tree Traversal (Level Order Traversal)
 */
func bfs(_ root: TreeNode?) -> [Int] {
    guard let root else { return [] }
    
    var queue: [TreeNode] = [root]
    var result: [Int] = []
    
    while !queue.isEmpty {
        let node = queue.removeFirst() // Dequeue the front element
        result.append(node.val) // Process node
        
        if let left = node.left {
            queue.append(left) // Enqueue left child
        }
        if let right = node.right {
            queue.append(right) // Enqueue right child
        }
    }
    
    return result
}
/*:
 --------------------------------------------------------------
 ## BFS Binary Tree Traversal (Vertical Order Traversal)
 When solving Binary Tree Vertical Order Traversal, you track the column index along with each node. This ensures nodes are grouped by vertical column.

 Key Changes for Vertical Order BFS:
 - Use a queue of (node, column index) instead of just nodes.
 - Keep a dictionary columnTable[column] to store values for each column.
 - Track minColumn and maxColumn to sort the final result.
 */
func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root else { return [] }
    
    var columnTable = [Int: [Int]]() // Dictionary to store nodes by column
    var queue: [(TreeNode, Int)] = [(root, 0)] // BFS queue (node, column index)
    var minColumn = 0, maxColumn = 0
    
    while !queue.isEmpty {
        let (node, column) = queue.removeFirst() // Dequeue
        
        columnTable[column, default: []].append(node.val) // Store value in column
        
        // Update min/max column indices
        minColumn = min(minColumn, column)
        maxColumn = max(maxColumn, column)
        
        // Enqueue children with column shifts
        if let left = node.left {
            queue.append((left, column - 1))
        }
        if let right = node.right {
            queue.append((right, column + 1))
        }
    }
    
    // Collect results in order from minColumn to maxColumn
    return (minColumn...maxColumn).compactMap { columnTable[$0] }
}


//: [Next](@next)
