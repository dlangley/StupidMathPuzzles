//
//  InputStacks.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/17/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

extension PuzzleInputV {
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        if !self.arrangedSubviews.isEmpty {
            for view in self.arrangedSubviews {
                self.removeArrangedSubview(view)
            }
        }
        
        if let check = puzzle.current {
            switch check {
            case .fizzBuzz:
                for var i = 0; i < 3; i++ {
                    let input = UITextField()
                    input.backgroundColor = UIColor.whiteColor()
                    
                    switch i {
                    case 0: input.placeholder = "Fizz"
                    case 1: input.placeholder = "Buzz"
                    default: input.placeholder = "Limit"
                    }
                    
                    input.keyboardType = .NumberPad
                    input.delegate = self
                    input.addTarget(self, action: Selector("trackInput:"), forControlEvents: UIControlEvents.EditingChanged)
                    self.addArrangedSubview(input)
                }
            case .factorial:
                let input = UITextField()
                input.backgroundColor = UIColor.whiteColor()
                input.placeholder = "Enter a number for factorial"
                input.keyboardType = .NumberPad
                input.delegate = self
                input.addTarget(self, action: Selector("trackInput:"), forControlEvents: UIControlEvents.EditingChanged)
                self.addArrangedSubview(input)
            default: break
            }
        }
    }
}
