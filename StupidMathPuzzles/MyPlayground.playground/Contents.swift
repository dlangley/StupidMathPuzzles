//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
str


//Runs automatically. Just start typing.
//See "About" for shortcuts

extension Int {
    
    func seqTo() -> [Int] {
        var arr = [Int]()
        for var i = 1; i <= self; i++ {
            arr.append(i)
        }
        return arr
    }
}

extension Array {
    
    func factorial() -> Int? {
        var sum = 0
        if !self.isEmpty {
            for var that = 0; that < self.count; that++ {
                if self[that].dynamicType == Swift.Int {
                    if (self[that] as! Int) < 0 {
                        return nil
                    } else if (self.count == 1) && ((self[that] as! Int) == 0) {
                        return 1
                    }
                    sum = sum + (self[that] as! Int)
                } else {
                    return nil
                }
            }
        } else {
            return nil
        }
        return sum
    }
}

func fizzBuzz(x: Int, _ y: Int,
    _ n: Int) -> [String]  {
        var strings = [String]()
        for that in n.seqTo() {
            if that % x == 0 && that % y == 0 {
                strings.append("FB")
            } else if that % y == 0 {
                strings.append("B")
            } else if that % x == 0 {
                strings.append("F")
            } else {
                strings.append("\(that)")
            }
        }
        return strings
}

print(fizzBuzz(4, 7, 30))
print(5.seqTo().factorial()!)
print([0].factorial()!)
print([1].factorial()!)
