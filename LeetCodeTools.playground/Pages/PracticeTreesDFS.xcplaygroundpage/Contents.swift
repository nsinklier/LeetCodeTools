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
//: [Next](@next)
