//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var k : Double = 0x1

var n : Double = ((1/(pow(16.0, k)))*(4/((8*k) + 1) - 2/((8*k) + 4) - 1/((8*k) + 5) - 1/((8*k) + 6)))

var f = n

var t = pow(2.0, -3)


extension Int {
    var factorial : Int {
        get {
            return self > 1 ? self * (self - 1).factorial : 1
        }
    }
    
    var list : [Int] {
        get {
            return self > 1 ? (self - 1).list + [self] : [1]
        }
    }
    
    var digits : [Int] {
        get {
            var arr = [Int]()
            var string = "\(self)"
            for ch in string.characters {
                arr += [Int("\(ch)")!]
            }
            return arr
        }
    }
}

extension Double {
    var factorial : Double {
        get {
            return self > 1 ? self * (self - 1).factorial : 1
        }
    }
}


var i = 150.0

//i.list
i.factorial
//i.factorial.digits

let nestedArray = [[1,2,3], [4,5,6]]

let flattenedArray = nestedArray.flatMap { $0 }
flattenedArray // [1, 2, 3, 4, 5, 6]


Int.max
