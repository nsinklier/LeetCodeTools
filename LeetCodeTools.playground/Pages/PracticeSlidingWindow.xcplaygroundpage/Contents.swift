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
//: [Next](@next)
