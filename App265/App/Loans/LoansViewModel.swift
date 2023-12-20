//
//  LoansViewModel.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI
import CoreData

final class LoansViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var selectedLoan: LoansModel? = nil
    @AppStorage("payments") var payments: [Int] = []
    
    // MARK: ADD LOAN
    @Published var name_loan: String = ""
    @Published var loan_amount: String = ""
    @Published var payment_per_month: String = ""
    @Published var start: Date = Date()
    @Published var end: Date = Date()
    @Published var down_payment: String = ""
    
    @Published var loans: [LoansModel] = []
    
    @Published var payment_amount: String = ""
    @Published var isPayment: Bool = false
    
    func addLoan() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "LoansModel", into: context) as! LoansModel

        loan.name = name_loan
        loan.loan_amount = Int16(loan_amount) ?? 0
        loan.payment_month = Int16(payment_per_month) ?? 0
        loan.start = start
        loan.end = end
        loan.down_payment = Int16(down_payment) ?? 0
        
        loan.loan_id = Int16.random(in: 1...2555)
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchLoans() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<LoansModel>(entityName: "LoansModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.loans = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.loans = []
        }
    }
}
