//: [Previous](@previous)
import Foundation
//:# Helpful Tools for LeetCode Problems
/*:
 ## stride() (Custom iterations through loops)
 _Use case:_ When you need to iterate in reverse order through an array
*/
//: Count down from 10 to 1
for i in stride(from: 10, through: 1, by: -1) {
    print(i)
}
//: Count from 0 to 50, stepping by 5
for i in stride(from: 0, through: 50, by: 5) {
    print(i)
}
/*:
 -------------------------------------------------------------------
 ## zip() (Pairing Two Lists Together)
 _Use case:_ When you need to iterate over two arrays at once
*/
let zipNums = [10, 20, 30]
let letters = ["a", "b", "c"]

for (letter, number) in zip(letters, zipNums) {
    print("Index: \(letter), Value: \(number)")
}
/*:
 ✔ LeetCode Example:
 - *Two-pointer* problems: Merging sorted arrays (zip(arr1, arr2))
 - *"Relative Ranks"* problem: Pair scores with indices.
 */
/*:
 -------------------------------------------------------------------
 ## Dictionary(_:uniquingKeysWith:) (Fast Dictionary Creation)
 _Use case:_ Quickly convert arrays into a dictionary for O(1) lookups.
*/
//: Find last occurrence of each number in an array
let nums = [10, 20, 10, 30]
let lastIndex = Dictionary(nums.enumerated().map { ($1, $0) }, uniquingKeysWith: { _, new in new })
print(lastIndex)
//: Find first pccurrence of each number in an array
let firstIndex = Dictionary(nums.enumerated().map { ($1, $0) }, uniquingKeysWith: { first, _ in first })
print(firstIndex)
/*:
 ✔ LeetCode Example:
 - *Two Sum* (num → index)
 - Finding duplicates in an array
 */
/*:
 -------------------------------------------------------------------
 ## reduce() (Compactly Summing or Combining Values)
 _Use case:_ Convert an array into a single value (sum, product, string concatenation).
*/
let digits = [1, 2, 3, 4]
let number = digits.reduce(0) { $0 * 10 + $1 }
print(number) // 1234
/*:
 ✔ LeetCode Example:
 - Convert a list of digits into an integer
 - Sum of digits in an array
 */
/*:
 -------------------------------------------------------------------
 ## sorted(by:) (Sorting with a Custom Comparator)
 _Use case:_ Sort numbers, strings, or custom objects efficiently.
*/
let unsorted = [3, 3, 2, 2, 2, 1]
let freqDict = Dictionary(unsorted.map { ($0, 1) }, uniquingKeysWith: +)
let sorted = freqDict.keys.sorted { freqDict[$0]! > freqDict[$1]! }
print(sorted)
/*:
 ✔ LeetCode Example:
 - Sort characters by frequency
 - Find the k most frequent elements
 */
/*:
 -------------------------------------------------------------------
 ## Set for O(1) Lookups (Faster than Arrays)
 _Use case:_ Checking if an element exists O(1) instead of O(n).
*/
let setNums = [1, 2, 3, 3, 4, 5, 5]
let uniqueNums = Array(Set(setNums))
print(uniqueNums) // [1, 2, 3, 4, 5]
/*:
 ✔ LeetCode Example:
 - Check if a word exists in a dictionary
 - Detect cycles in a graph
 */
/*:
 -------------------------------------------------------------------
 ## filter() (Removing Unwanted Values)
 _Use case:_ Quickly filter out values without writing a loop.
*/
let str = "leetcode"
let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
let filtered = String(str.filter { !vowels.contains($0) })
print(filtered) // "ltcd"
/*:
 ✔ LeetCode Example:
 - Remove elements from an array in-place
 - Filter out non-alphabetic characters from a string
 */
/*:
 -------------------------------------------------------------------
 ## enumerated() (Get Index While Looping)
 _Use case:_ Looping through an array while keeping track of the index.
*/
let array = ["a", "b", "c"]
for (index, value) in array.enumerated() {
    print("\(index): \(value)")
}
/*:
 ✔ LeetCode Example:
 - Tracking original indices before sorting
 - Processing characters with positions
 */
/*:
 -------------------------------------------------------------------
 ## contains(where:) (More Efficient than filter().count > 0)
 _Use case:_ Stop checking as soon as a condition is met.
*/
let containsNums = [1, 3, 5, 7]
let hasEven = containsNums.contains { $0 % 2 == 0 }
print(hasEven) // false
/*:
 ✔ LeetCode Example:
 - Check if any subarray meets a condition
 - Find if a string contains a certain type of character
 */

//: [Next](@next)
