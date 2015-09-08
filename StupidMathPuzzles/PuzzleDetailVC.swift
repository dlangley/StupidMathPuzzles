//
//  PuzzleDetailVC.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/4/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class PuzzleDetailVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    
    
    func setup() {
        textField.delegate = self
        textField.addTarget(self, action: Selector("showResult"), forControlEvents: UIControlEvents.EditingChanged)
        textField.text = ""
        if let check = Puzzle.sharedInstance.current {
            self.navigationItem.title = check.desc
            switch check {
            case .factorial:
                textField.placeholder = "Enter a number."
                textField.keyboardType = .NumberPad
                textView.text = "Results"
            default:
                textView.text = "Pending Implementation"
            }
            
        }
    }
    
    func showResult() {
        textView.text = textField.text!.isEmpty ? "" : "\(Int(textField.text!)!.seqTo().factorial!)"
    }
    
    override func viewWillAppear(animated: Bool) {
        setup()
        
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Textfield Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch string.characters.count {
        case 0: return true
        default:
            if Int(string) != nil {
                textView.text = textField.text!.isEmpty ? "" : "\(Int(textField.text!)!.seqTo().factorial!)"
                return true
            } else {
                return false
            }
        }
    }

}
