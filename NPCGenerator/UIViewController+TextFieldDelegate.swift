//
//  UIViewController+TextFieldDelegate.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/30/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

extension UIViewController: TextFieldDelegate {
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if let textField = textField as? CRTextField {
            textField.buttonAction(textField)
        }
    }

}

