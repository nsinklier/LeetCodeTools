//: [Previous](@previous)
import Foundation
/*:
 # Sliding Window
*/
/*:
 -------------------------------------------------------------------
 ## [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock)
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 
 ### Example 1:
 - __Input:__ prices = [7,1,5,3,6,4]
 - __Output:__ 5
 - __Explanation:__ Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5. *Note* that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 */
class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = (index: 0, value: Int.max)

        for (index, price) in prices.enumerated() {
            if price < minPrice.value {
                minPrice = (index, price)
                continue
            }

            if maxProfit < (price - minPrice.value) {
                maxProfit = price - minPrice.value
            }
        }

        return maxProfit
    }
}
/*:
 -------------------------------------------------------------------
 ## [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters)
 Given a string s, find the length of the longest substring without duplicate characters.
 
 ### Example 1:
 - __Input:__ s = "abcabcbb"
 - __Output:__ 3
 - __Explanation:__ The answer is "abc", with the length of 3.
 */
class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastIndex = [Character: Int]()
        var maxLength = 0
        var startIndex = 0

        for (index, char) in s.enumerated() {
            if let dupIndex = lastIndex[char] {
                startIndex = max(startIndex, dupIndex + 1)
            }

            maxLength = max(maxLength, index - startIndex + 1)
            lastIndex[char] = index
        }

        return maxLength
    }
}
/*:
 -------------------------------------------------------------------
 ## [567. Permutation in String](https://leetcode.com/problems/permutation-in-string)
 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
 In other words, return true if one of s1's permutations is the substring of s2.
 
 ### Example:
 - __Input:__ s1 = "ab", s2 = "eidbaooo"
 - __Output:__ true
 - __Explanation:__ s2 contains one permutation of s1 ("ba").
 */
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let needCount = s1.count
        let haveCount = s2.count
        guard needCount <= haveCount else { return false }

        // create map of what we need
        var need = [Character: Int]()
        for char in s1 { need[char, default: 0] += 1 }

        // create array of s2 to traverse
        let chars = Array(s2)
        var window = [Character: Int]()
        
        for i in 0..<haveCount {
            // slide the window to the next value
            window[chars[i], default: 0] += 1

            // remove the left end of the windows values when it's too big
            if i >= needCount {
                let indexToRemove = i - needCount
                let leftEnd = chars[indexToRemove]
                let freq = window[leftEnd] ?? 1
                if freq == 1 {
                    window[leftEnd] = nil
                } else {
                    window[leftEnd] = freq - 1
                }
            }

            // compare windows
            if window == need { return true }
        }

        // never found need in window
        return false
    }
}
//: [Next](@next)
