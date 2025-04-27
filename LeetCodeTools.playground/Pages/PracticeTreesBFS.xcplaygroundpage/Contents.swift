//: [Previous](@previous)
import Foundation
/*:
 # Trees
 ## BFS
 ### Given definition of TreeNode
*/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
/*:
 -------------------------------------------------------------------
 ## [314. Binary Tree Vertical Order Traversal](https://leetcode.com/problems/binary-tree-vertical-order-traversal)
 Given the root of a binary tree, return the vertical order traversal of its nodes' values. (i.e., from top to bottom, column by column).

 If two nodes are in the same row and column, the order should be from left to right.
 
 ### Example 1:
 ![tree](vtree.png)
 - __Input:__ root = [3,9,20,null,null,15,7]
 - __Output:__ [[9],[3,15],[20],[7]]
 */
class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        
        var q = [(node: TreeNode?, column: Int)]()
        var map = [Int: [Int]]()
        var minColumn = 0
        var maxColumn = 0
        
        q.appemd((root, 0))
        while !q.isEmpty {
            // Dequeue front
            let (node, column) = q.removeFirst()
            
            // Insert node into correct column
            map[column, default: []].append(node.val)
            
            // Enqueue children
            if left = node.left { q.append((left, column - 1)) }
            if right = node.right { q.append((right, column + 1)) }
            
            // Save max and min columns for constructing the 2d array
            minColumn = min(column, minColumn)
            maxColumn = max(column, maxColumn)
        }
        
        // Construct the array using the values from min...max
        return (minColumn...maxColumn).compactMap { column in
            map[column]
        }
    }
}
/*:
 -------------------------------------------------------------------
 ## [987. Vertical Order Traversal of a Binary Tree](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree)
 Given the root of a binary tree, calculate the vertical order traversal of the binary tree.

 For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).

 The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

 Return the vertical order traversal of the binary tree.
 
 ### Example 1:
 ![tree](vtree1.jpg)
 - __Input:__ root = [3,9,20,null,null,15,7]
 - __Output:__ [[9],[3,15],[20],[7]]
 - __Explanation:__
 Column -1: Only node 9 is in this column.
 Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
 Column 1: Only node 20 is in this column.
 Column 2: Only node 7 is in this column.
 */
class Solution987 {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        
        var q: [(node: TreeNode, column: Int, row: Int)] = [(root, 0, 0)]
        var map = [Int: [(row: Int, value: Int)]]()
        var minColumn = 0
        var maxColumn = 0
        
        while !q.isEmpty {
            // DQ front
            let (node, column, row) = q.removeFirst()
            
            // Add to map
            map[column, default: []].append((row, node.val))
            
            // Get Max/Min
            minColumn = min(minColumn, column)
            maxColumn = max(maxColumn, column)
        }
        
        //Construct return from map's columns between min...max. sorted by row
        var values: [[Int]] = []
        var tuples: [(row: Int, value: Int)] = (minColumn...maxColumn).compactmap { map[$0] }
        for col in 0..<tuples.count {
            tuples[col].sort { $0.row < $1.row || ($0.row == $1.row && $0.value < $1.value) }
            values.append(tuples[col].map { $0.value })
        }
        
        return values
    }
}

//: [Next](@next)
