//: Playground - noun: a place where people can play

import Cocoa

extension String {
    var ints : [Int] {
        get {
            var arr = [Int]()
            for char in self.characters {
                arr += [Int("\(char)")!]
            }
            return arr
        }
    }
}

class pMath {
    class func add(augend : [Int], addend : [Int] = [0]) -> [Int] {
        var arr1 = augend, arr2 = addend
        var endSum = 0
        endSum = arr1.removeLast() + arr2.removeLast()
        if arr1.isEmpty && arr2.isEmpty {
            return endSum < 10 ? [endSum] : [endSum / 10] + [endSum % 10]
        } else if !arr1.isEmpty {
            print("Arr1")
            return add(arr1) + [endSum % 10]
        } else if !arr2.isEmpty {
            print("Arr1")
            return add(arr2) + [endSum % 10]
        } else if !arr1.isEmpty && !arr2.isEmpty {
            print("Arr1")
            return add(arr1, addend: arr2) + [endSum % 10]
        }
        return [endSum]
    }
    
    class func addL(augend : [Int], addend : [Int] = [0]) -> [Int]  {
        var arr1 = augend, arr2 = addend, result = [Int](), remainder = 0
        var endSum = 0
        endSum = arr1.removeLast() + arr2.removeLast()
        result += [endSum % 10]
        if endSum > 10 {
            remainder = (endSum - 10)/result.last!
            print("\(endSum) > 10")
            if arr1.isEmpty && arr2.isEmpty {
                result.insert(remainder, atIndex: 0)
            } else if arr2.isEmpty {
                let compound = addL([remainder], addend: arr1) + result
                result = compound
            } else if arr1.isEmpty {
                let compound = addL([remainder], addend: arr2) + result
                result = compound
            } else {
                let augEndDigit = arr1.removeLast() + remainder
                arr1 += [augEndDigit]
                let compound = addL(arr1, addend: arr2) + result
                result = compound
            }
        }
        return result
    }
}


var x = [4], y = [75], z = [56]
pMath.add(x, addend: y)
pMath.addL(z, addend: y)

var a = "6", b = "75", c = "67"
pMath.add(c.ints, addend: a.ints)
pMath.addL(b.ints, addend: c.ints)

/*

Addition

Terms Used in Addition Key
In addition, an augend and an addend are added to find a sum.

In the following equation, 6 is the augend, 3 is the addend, and 9 is the sum:

6 + 3 = 9

NOTE: Sometimes both the augend and addend are called addends. Sometimes the sum is called the total.

Subtraction

Terms Used in Subtraction Key
In subtraction, a subtrahend is subtracted from a minuend to find a difference.

In the following equation, 9 is the minuend, 3 is the subtrahend, and 6 is the difference.

9 – 3 = 6

Multiplication

Terms Used in Multiplication Key
In multiplication, a multiplicand and a multiplier are multiplied to find a product.

In the following equation, 6 is the multiplicand, 3 is the multiplier, and 18 is the product.

6 x 3 = 18

NOTE: Sometimes the multiplicand and the multiplier are both called factors.

Division

Terms Used in Division Key
In division, a dividend is divided by a divisor to find a quotient.

In the following equation, 18 is the dividend, 3 is the divisor, and 6 is the quotient.

18 / 3 = 6

If there is an amount left over, it is called the remainder. The remainder cannot be evenly divided by the divisor. For example, if you divide 18 by 7, you will get a remainder:

18 / 7 = 2, with a remainder of 4

*/