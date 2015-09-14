//
//  PuzzleInputV.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/10/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class PuzzleInputV: UIStackView, UITextFieldDelegate {
    
    var textFields = [UITextField]()
    var values = [Int]()
    var delegate : InputDelegate?
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        for view in self.arrangedSubviews {
            self.removeArrangedSubview(view)
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
            default:
                break
            }
        }
    }
    
    
    func trackInput(textfield: UITextField) {
        
        values.removeAll()
        for field in textFields {
            values += [Int(field.text!)!]
        }
        if !textfield.text!.isEmpty && delegate != nil {
            delegate!.update(textfield.text!)
        }
    }
    
    // MARK: - Textfield Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let pDetail = PuzzleDetailVC()
        
        switch string.characters.count {
        case 0: return true
        default:
            if Int(string) != nil {
                //                    detail.textView.text = textField.text!.isEmpty ? "" : "\(Int(textField.text!)!.seqTo().factorial!)"
                if delegate != nil {
                    delegate!.update(solve(puzzle.current, forParams: values))
                }
                return true
            } else {
                return false
            }
        }
        
        
    }
    
    func solve(puzzle : Puzzle.list, forParams : [Int]) -> String {
        return ""
    }
}

protocol InputDelegate : class {
    func update(results: String)
}
