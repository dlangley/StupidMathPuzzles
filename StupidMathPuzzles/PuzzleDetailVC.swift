//
//  PuzzleDetailVC.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/4/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class PuzzleDetailVC: UIViewController, InputDelegate {
    
//    @IBOutlet var textField: UITextField!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var inputLine: PuzzleInputV!
    @IBOutlet var textView: UITextView!
    
    
    func setup() {
//        textField.delegate = self
//        textField.addTarget(self, action: Selector("showResult"), forControlEvents: UIControlEvents.EditingChanged)
//        textField.text = ""
        inputLine.delegate = self
        if let check = puzzle.current {
            self.navigationItem.title = check.desc
            switch check {
            case .factorial:
//                textField.placeholder = "Enter a number."
//                textField.keyboardType = .NumberPad
                textView.text = "Results"
            default:
                textView.text = "Pending Implementation"
            }
            
        }
        view.hidden = false
    }
    
    func showResult() {
//        textView.text = textField.text!.isEmpty ? "" : "\(Int(textField.text!)!.seqTo().factorial!)"
    }
    
    override func viewWillAppear(animated: Bool) {
        setup()
        
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // String returned from text fields.
    func update(results: String) {
        if let check = puzzle.current {
            switch check {
            case .factorial: textView.text = results.isEmpty ? "" : "\(Int(results)!.seqTo().factorial!)"
            case .fizzBuzz:
                if let f = inputLine.arrangedSubviews[0] as? UITextField {
                    if let b = inputLine.arrangedSubviews[1] as? UITextField {
                        if let l = inputLine.arrangedSubviews[2] as? UITextField {
                            textView.text = "\(puzzle.fizzBuzz(fizz: Int(f.text!) ?? Int.max, buzz: Int(b.text!) ?? Int.max, limit: Int(l.text!) ?? 20))"
                        }
                    }
                }
            default: break
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.textView.reloadInputViews()
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
