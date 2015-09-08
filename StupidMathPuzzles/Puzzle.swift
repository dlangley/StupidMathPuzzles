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
    
    var current : list?
    
    enum list : Int{
        case factorial = 0, fizzBuzz
        
        static var all : [list] = [.factorial, .fizzBuzz]
        
        var desc : String {
            get {
                return "\(self)".componentsSeparatedByString(".").last!.titleString
            }
        }
    }
    
    func fizzBuzz(fizz f: Int, buzz b: Int, limit l: Int) -> [String]  {
        var strings = [String]()
        for that in l.seqTo() {
            if that % f == 0 && that % b == 0 {
                strings.append("FB")
            } else if that % b == 0 {
                strings.append("B")
            } else if that % f == 0 {
                strings.append("F")
            } else {
                strings.append("\(that)")
            }
        }
        return strings
    }
}