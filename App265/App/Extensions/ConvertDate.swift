//
//  ConvertDate.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
