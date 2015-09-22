//
//  PuzzleInputV.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/10/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class PuzzleInputV: UIStackView, UITextFieldDelegate {
    
    weak var delegate : InputDelegate?
    
    // Textfield Observer
    func trackInput(textfield: UITextField) {
        if delegate != nil {
            delegate!.update()
        }
    }
    
    // MARK: - Textfield Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        switch string.characters.count {
        case 0: return true
        default: return range.location <= 2 && Int(string) != nil
        }
    }
}

protocol InputDelegate : class {
    func update()
}
