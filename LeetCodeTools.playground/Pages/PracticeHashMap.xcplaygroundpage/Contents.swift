//: [Previous](@previous)
import SwiftUI
/*:
 # HashMap
*/
/*:
 -------------------------------------------------------------------
 ## [1. Two Sum](https://leetcode.com/problems/two-sum)
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
- You may assume that each input would have exactly one solution, and you may not use the same element twice.
- You can return the answer in any order..
 ### Example 1:
 - __Input:__ nums = [2,7,11,15], target = 9
 - __Output:__ [0,1]
 * __Explanation:__ Because nums[0] + nums[1] == 9, we return [0, 1].
 */
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var valueIndex = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let complimentIndex = valueIndex[target - num] {
                return [complimentIndex, index]
            }
            valueIndex[num] = index
        }
        return []
    }
}
/*:
 -------------------------------------------------------------------
 ## [36. Valid Sudoku](https://leetcode.com/problems/valid-sudoku/description/)
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 1. Each row must contain the digits 1-9 without repetition.
 2. Each column must contain the digits 1-9 without repetition.
 3. Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:
 - A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 - Only the filled cells need to be validated according to the mentioned rules.
 ### Example 1:
![sudoku image](Sudoku.png)
 - __Input:__ board =
    - [["5","3",".",".","7",".",".",".","."]
    - ,["6",".",".","1","9","5",".",".","."]
    - ,[".","9","8",".",".",".",".","6","."]
    - ,["8",".",".",".","6",".",".",".","3"]
    - ,["4",".",".","8",".","3",".",".","1"]
    - ,["7",".",".",".","2",".",".",".","6"]
    - ,[".","6",".",".",".",".","2","8","."]
    - ,[".",".",".","4","1","9",".",".","5"]
    - ,[".",".",".",".","8",".",".","7","9"]]
 - __Output:__ true
 */
class Solution36 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowMap = [Int: Set<Character>]()
        var colMap = [Int: Set<Character>]()
        var gridMap = [Int: Set<Character>]()


        for row in 0..<9 {
            for col in 0..<9 {
                let value = board[row][col]
                if value == "." { continue }

                let grid = gridValue(col, row)
                if rowMap[row]?.contains(value) ?? false || colMap[col]?.contains(value) ?? false || gridMap[grid]?.contains(value) ?? false {
                    return false
                }
                
                rowMap[row, default: []].insert(value)
                colMap[col, default: []].insert(value)
                gridMap[grid, default: []].insert(value)
            }
        }
        return true
    }

    private func gridValue(_ col: Int, _ row: Int) -> Int {
        let first = 0...2
        let second = 3...5
        let third = 6...8

        if first ~= col && first ~= row { return 0 }
        if second ~= col && first ~= row { return 1 }
        if third ~= col && first ~= row { return 2 }
        if first ~= col && second ~= row { return 3 }
        if second ~= col && second ~= row { return 4 }
        if third ~= col && second ~= row { return 5 }
        if first ~= col && third ~= row { return 6 }
        if second ~= col && third ~= row { return 7 }
        if third ~= col && third ~= row { return 8 }
        
        return -1
    }
}
/*:
## [347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/description/)
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
- You may assume that each input would have exactly one solution, and you may not use the same element twice.
- You can return the answer in any order..
### Example 1:
- __Input:__ nums = [1,1,1,2,2,3], k = 2
- __Output:__ [1,2]
*/
class Solution347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // map frequency
        var frequencyMap = [Int: Int]()
        for num in nums { frequencyMap[num, default: 0] += 1 }

        // make sorted array from map
        var result = [(value: Int, frequency: Int)]()
        for (key, value) in frequencyMap {
            result.append((key, value))
        }
        result.sort { $0.frequency > $1.frequency }

        // return slice to 'k'
        return Array(result.map { $0.value }[..<k])
    }
}
//: [Next](@next)
