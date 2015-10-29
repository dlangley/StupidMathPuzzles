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
    
    /**
     The *oh so popular* GOTO test method for RECURSION?!?!? (for some odd reason)
     
     # MYTH BUSTER!!!
     **The SAME output is possible with a loop-based API.**
     (With a negligible hit on memory in the scope of a list small enough to read on a device.)

     *Therefore, this can ONLY be used as a Trolling Tool at **BEST** unless you specify the desired type of implementation in your "assessment".*
     
     ## Parameters
     - **fizz: Int** -> the multiple to be replaced with "F".
     - **buzz: Int** -> the multiple to be replaced with "B".
     - **limit: Int** -> determines how long the list of numbers is.
     
     ## Returns
     A modified list of numbers from 0 to the specified limit.
     (Replaces "Fizz" multiples with "F", and "Buzz" multiples with "B")
     */
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


