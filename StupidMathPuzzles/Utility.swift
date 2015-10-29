//
//  Utility.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/4/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import Foundation


let puzzle = Puzzle.sharedInstance

extension Int {
    var list : [Int] {
        get {
            return self > 1 ? (self - 1).list + [self] : [1]
        }
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


class pMath {
    private var opStack = [Op]()
    
    private enum Op {
        case opperand([Int])
        case plus(augend : [Int], addend : [Int])
        case minus(minuend : [Int], subtrahend : [Int])
        case times(multiplicand : [Int], multiplier : [Int])
        case divideBy(dividend : [Int], divisor : [Int])
    }
    
    
    
    func eval() -> [Int] {
        return [Int]()
    }
    
}