//
//  Utility.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/4/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import Foundation

extension Array {
    var factorial : Int? {
        get {
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
}

extension Int {
    func seqTo() -> [Int] {
        var arr = [Int]()
        for var i = 0; i <= self; i++ {
            arr.append(i)
        }
        return arr
    }
}

extension String {
    var titleString : String {
        get {
            var str = ""
            for var i = 0; i < self.characters.count; i++ {
                let index = self.startIndex.advancedBy(i)
                let ch = self[index]
                
                switch "\(ch)" {
                case " " : continue
                case "\(ch)".uppercaseString:
                    str += (i != 0) && (Int("\(ch)") == nil) ? " \(ch)" : "\(ch)"
                default: str += "\(ch)".lowercaseString
                }
            }
            return str.capitalizedString
        }
    }
}