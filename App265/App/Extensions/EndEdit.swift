//
//  EndEdit.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
