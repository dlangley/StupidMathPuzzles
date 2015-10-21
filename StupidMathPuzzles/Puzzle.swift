//
//  Puzzle.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/3/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class Puzzle {
    
    static let sharedInstance = Puzzle()
    
    var current : list!
    
    enum list : Int {
        case factorial = 0, fizzBuzz, generic

        
        static var all : [list] = [.factorial, .fizzBuzz]
        
        var desc : String {
            get {
                return "\(self)".componentsSeparatedByString(".").last!.titleString
            }
        }
    }
    
    func fizzBuzz(fizz f: Int = Int.max, buzz b: Int = Int.max, limit l: Int = 0) -> [String]  {
        switch l {
        case 0: return ["\(l)"]
        case let check where check % f == 0 && check % b == 0: return fizzBuzz(fizz: f, buzz: b, limit: l-1) + ["FB"]
        case let check where check % f == 0: return fizzBuzz(fizz: f, buzz: b, limit: l-1) + ["F"]
        case let check where check % b == 0: return fizzBuzz(fizz: f, buzz: b, limit: l-1) + ["B"]
        default: return fizzBuzz(fizz: f, buzz: b, limit: l-1) + ["\(l)"]
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



let puzzle = Puzzle.sharedInstance