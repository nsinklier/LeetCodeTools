//: [Previous](@previous)
import Foundation
/*:
 # Trees
 ## DFS
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
 ## [129. Sum Root to Leaf Numbers](https://leetcode.com/problems/sum-root-to-leaf-numbers)
 You are given the root of a binary tree containing digits from 0 to 9 only.

 Each root-to-leaf path in the tree represents a number.

 For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
 Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a 32-bit integer.

 A leaf node is a node with no children.
 
 ### Example 1:
 ![tree](num2tree.jpg)
 - __Input:__ root = [4,9,0,5,1]
 - __Output:__ 1026
 * __Explanaition:__
    - The root-to-leaf path 4->9->5 represents the number 495.
    - The root-to-leaf path 4->9->1 represents the number 491.
    - The root-to-leaf path 4->0 represents the number 40.
    - Therefore, sum = 495 + 491 + 40 = 1026.
 */
class Solution129 {
    private var sum = 0

    func sumNumbers(_ root: TreeNode?) -> Int {
        accumulate(root, curSum: 0)
        return sum
    }

    private func accumulate(_ root: TreeNode?, curSum: Int) {
        guard let root else { return }
        let number = curSum * 10 + root.val
        
        if root.isLeaf {
            sum += number
            return
        }

        accumulate(root.left, curSum: number)
        accumulate(root.right, curSum: number)
    }
}

extension TreeNode {
    var isLeaf: Bool { left == nil && right == nil }
}
/*:
 -------------------------------------------------------------------
 ## [270. Closest Binary Search Tree Value](https://leetcode.com/problems/closest-binary-search-tree-value)
 Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target.
 If there are multiple answers, print the smallest.
 
 ### Example 1:
 ![tree](closestTree.jpg)
 - __Input:__ root = [4,2,5,1,3], target = 3.714286
 - __Output:__ 4
 * __Constraints:__
    - The number of nodes in the tree is in the range [1, 104].
    - 0 <= Node.val <= 109
    - -109 <= target <= 109
 */
class Solution270 {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else { return Int.max }

        let current = root.val
        let leftClosest = closestValue(root.left, target)
        let rightClosest = closestValue(root.right, target)

        let candidates = [current, leftClosest, rightClosest]
        
        return candidates.min(by: { abs(Double($0) - target) < abs(Double($1) - target) })!
    }
}
//: [Next](@next)
