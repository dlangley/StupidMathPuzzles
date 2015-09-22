//
//  PuzzleDetailVC.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/4/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class PuzzleDetailVC: UIViewController, InputDelegate {
    
    @IBOutlet var stackView: UIStackView!       // layout stack for the entire VC, may not use
    @IBOutlet var inputLine: PuzzleInputV!      // layout stack for userInput ***
    @IBOutlet var textView: UITextView!
    
    
    func setup() {
        inputLine.delegate = self
        textView.text = "Results"
        view.hidden = false
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
    func update() {
        if let check = puzzle.current {
            switch check {
            case .factorial:
                if let f = inputLine.arrangedSubviews[0] as? UITextField {
                    textView.text = f.text!.isEmpty ? "" : String(format: "%.0f", arguments: [(Double(f.text!)!.factorial)])
                } else {
                    textView.text = "Error"
                }
            case .fizzBuzz:
                if let f = inputLine.arrangedSubviews[0] as? UITextField {
                    if let b = inputLine.arrangedSubviews[1] as? UITextField {
                        if let l = inputLine.arrangedSubviews[2] as? UITextField {
                            textView.text = "\(puzzle.fizzBuzz(fizz: Int(f.text!) ?? Int.max, buzz: Int(b.text!) ?? Int.max, limit: Int(l.text!) ?? Int()))"
                        }
                    }
                } else {
                    textView.text = "Error"
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
