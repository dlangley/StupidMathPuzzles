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

