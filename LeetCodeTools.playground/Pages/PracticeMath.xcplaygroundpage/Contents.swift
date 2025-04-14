//: [Previous](@previous)
import Foundation
/*:
 # Math
*/
/*:
 -------------------------------------------------------------------
 ## [67. Add Binary](https://leetcode.com/problems/add-binary)
 Given two binary strings a and b, return their sum as a binary string.
 
 ### Example 1:
 - __Input:__ a = "11", b = "1"
 - __Output:__ "100"
 */
class Solution67 {
    func addBinary(_ a: String, _ b: String) -> String {
        var x = Array(a)
        var y = Array(b)
        var overflow: Character = "0"
        var result = ""

        while !x.isEmpty || !y.isEmpty || overflow == "1" {
            let xDigit = !x.isEmpty ? x.removeLast() : "0"
            let yDigit = !y.isEmpty ? y.removeLast() : "0"

            let value = xDigit.binaryValue + yDigit.binaryValue + overflow.binaryValue

            switch value {
            case 0:
                result = "0" + result
            case 1:
                result = "1" + result
                overflow = "0"
            case 2:
                result = "0" + result
                overflow = "1"
            case 3:
                result = "1" + result
                overflow = "1"
            default:
                print("💣")
            }
        }

        return result
    }
}

extension Character {
    var binaryValue: Int { self == "1" ? 1 : 0 }
}
/*:
 -------------------------------------------------------------------
 ## [50. Pow(x,n)](https://leetcode.com/problems/powx-n)
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

 Constraints:

 - -100.0 < x < 100.0
 - -231 <= n <= 231-1
 - Either x is not zero or n > 0.
 - -104 <= xn <= 104
  
 ### Example 1:
 - __Input:__ x = 2.00000, n = 10
 - __Output:__ 1024.00000
 * __Explanation:__ [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 */
/*:
This __exponentiation by squaring__ algorithm builds on the notion that 2^4 == 2^2 * 2^2,
so squaring the previous square completes an exponential amount of work when compared to 2\*2\*2\*2,
you just have to handle the odd exponent (eg: 2^5) separately.
[This was a helpful video on this algorithm for me.](https://www.youtube.com/watch?v=bRMVU3Gy_JY)
 */
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = x
        var exponent = n
        var result: Double = 1

        // Handle negative exponent
        let isNegative = exponent < 0
        if isNegative { exponent = -exponent }

        while exponent > 0 {
            if exponent.isOdd {
                result *= base
            }
            base *= base
            exponent /= 2
        }

        return isNegative ? 1 / result : result
    }
}

extension Int {
    var isOdd: Bool { self % 2 == 1 }
}
/*:
 -------------------------------------------------------------------
 ## [43. Multiply Strings](https://leetcode.com/problems/multiply-strings)
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
 - Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.
 ### Example 1:
 - __Input:__ num1 = "2", num2 = "3"
 - __Output:__ "6"
 */
class Solution43 {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }

        let num1Array = Array(num1)
        let num2Array = Array(num2)
        var result = Array(repeating: 0, count: num1.count + num2.count)

        for i in stride(from: num1.count - 1, through: 0, by: -1) {
            guard let digit1 = Int(String(num1Array[i])) else { break }

            for j in stride(from: num2.count - 1, through: 0, by: -1) {
                let digit2 = Int(String(num2Array[j]))!
                let pos1 = i + j
                let pos2 = i + j + 1
                let sum = digit1 * digit2 + result[pos2]

                result[pos2] = sum % 10
                result[pos1] += sum / 10
            }
        }

        // Remove leading zeros
        var resultString = ""
        var leadingZero = true

        for digit in result {
            if digit == 0 && leadingZero { continue }
            leadingZero = false
            resultString.append(String(digit))
        }

        return resultString
    }
}
//: [Next](@next)
