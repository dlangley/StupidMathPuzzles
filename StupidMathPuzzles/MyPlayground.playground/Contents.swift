//: Playground - noun: a place where people can play

import UIKit
import Foundation


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
    
    func numsDown() -> [Int] {
        var arr = [Int]()
        for i in 0...self {
            arr.insert(i, atIndex: arr.startIndex)
        }
        
        return arr
    }
    
    var listTo : [Int] {
        get {
            var arr = [Int]()
            for i in 0...self {
                arr.insert(i, atIndex: (i == 0) ? arr.startIndex : 1)
            }
            
            return arr
        }
    }
}

extension Array {
    
    var fact : Int? {
        get {
            var notInts : Bool {
                get {
                    for item in self {
                        if item.dynamicType != Swift.Int {
                            return true
                        }
                    }
                    return false
                }
            }
            
            if notInts {
                return nil
            }
            return notInts ? 0 : 1
        }
    }
    
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
print(5.seqTo().factorial()! as! Int)
print(5.seqTo().fact! as? Int)
print([0].factorial()! as! Int)
print([1].factorial()! as! Int)

5.seqTo()
5.numsDown()
5.listTo