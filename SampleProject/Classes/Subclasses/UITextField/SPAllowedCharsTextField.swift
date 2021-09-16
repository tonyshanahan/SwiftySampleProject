//
//  SPAllowedCharsTextField.swift
//  <#Project Name#>
//
//  Created by <#Project Developer#> on 19/01/2011.
//  Copyright © 2016 <#Project Developer#> All rights reserved.
//

import UIKit

class SPAllowedCharsTextField: UITextField, UITextFieldDelegate {
    
    @IBInspectable var allowedChars: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        autocorrectionType = .no
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return prospectiveText.containsOnlyCharactersIn(allowedChars)
    }
}


extension String {
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(_ matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    
}
