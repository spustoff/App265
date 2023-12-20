//
//  CalculatorViewModel.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    
    @Published var cost_loan: CGFloat = 0
    @Published var down_payment: CGFloat = 0
    @Published var loan_period: CGFloat = 0
    @Published var percent: CGFloat = 0
}
