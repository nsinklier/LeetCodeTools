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
//: [Next](@next)
