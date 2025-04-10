//: [Previous](@previous)
import Foundation
/*:
 # PrefixSum
*/
/*:
 -------------------------------------------------------------------
 ## [523. Continuous Subarray Sum](https://leetcode.com/problems/continuous-subarray-sum/description/)
 Given an integer array nums and an integer k, return true if nums has a good subarray or false otherwise.

 A good subarray is a subarray where:
 - its length is at least two, and
 - the sum of the elements of the subarray is a multiple of k.
 Note that:
 - A subarray is a contiguous part of the array.
 - An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.
  
 ### Example 1:
 - __Input:__ nums = [23,2,4,6,7], k = 6
 - __Output:__ true
 * __Explanation:__ [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 */
class Solution523 {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var remainderIndex = [0: -1]
        var sum = 0

        for (index, num) in nums.enumerated() {
            sum += num
            let remainder = sum % k

            if let existingIndex = remainderIndex[remainder] {
                if index - existingIndex > 1 {
                    return true
                }
            } else {
                remainderIndex[remainder] = index
            }
        }

        return false
    }
}
/*:
 -------------------------------------------------------------------
 ## [974. Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/description/)
 Given an integer array nums and an integer k, return the number of non-empty subarrays that have a sum divisible by k.
 - A subarray is a contiguous part of an array.

 ### Example 1:
 - __Input:__ nums = [4,5,0,-2,-3,1], k = 5
 - __Output:__ 7
 * __Explanation:__ There are 7 subarrays with a sum divisible by k = 5:
 [4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
 */
class Solution974 {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var remainderOccurrences = [0: 1]
        var sum = 0
        var count = 0

        for num in nums {
            sum += num
            var remainder = sum % k

            // Handle negative remainders
            if remainder < 0 { remainder += k }

            if let occurrences = remainderOccurrences[remainder] {
                count += occurrences
            }

            remainderOccurrences[remainder, default: 0] += 1
        }

        return count
    }
}
/*:
  -------------------------------------------------------------------
  ## [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)
  Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
  - A subarray is a contiguous non-empty sequence of elements within an array.

  ### Example 1:
  - __Input:__ nums = [1,1,1], k = 2
  - __Output:__ 2
  */
class Solution560 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var map = [0: 1]
        var sum = 0

        for num in nums {
            sum += num

            if let occurrences = map[sum - k] {
                count += occurrences
            }
            
            map[sum, default: 0] += 1
        }
        return count
    }
}

private func gridValue(_ col: Int, _ row: Int) -> Int {
    if 0...2 ~= col && 0...2 ~= row { return 0 }
    if 3...5 ~= col && 0...2 ~= row { return 1 }
    if 6...8 ~= col && 0...2 ~= row { return 2 }
    if 0...2 ~= col && 3...5 ~= row { return 3 }
    if 3...5 ~= col && 3...5 ~= row { return 4 }
    if 6...8 ~= col && 3...5 ~= row { return 5 }
    if 0...2 ~= col && 6...8 ~= row { return 6 }
    if 3...5 ~= col && 6...8 ~= row { return 7 }
    if 6...8 ~= col && 6...8 ~= row { return 8 }
    
    return -1
}
//: [Next](@next)
