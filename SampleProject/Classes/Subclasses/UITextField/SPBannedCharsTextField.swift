//
//  SPBannedCharsTextField.swift
//  <#Project Name#>
//
//  Created by <#Project Developer#> on 19/01/2011.
//  Copyright © 2016 <#Project Developer#> All rights reserved.
//

import UIKit


class SPBannedCharsTextField: UITextField, UITextFieldDelegate {
  
  @IBInspectable var bannedChars: String = ""
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    delegate = self
    autocorrectionType = .no
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard string.count > 0 else {
      return true
    }
    
    let currentText = textField.text ?? ""
    let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
    
    return prospectiveText.doesNotContainCharactersIn(bannedChars)
  }
  
}


extension String {
  
  // Returns true if the string has no characters in common with matchCharacters.
  func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
    let characterSet = CharacterSet(charactersIn: matchCharacters)
    return self.rangeOfCharacter(from: characterSet) == nil
  }
  
}
