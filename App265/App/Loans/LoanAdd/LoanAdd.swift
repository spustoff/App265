//
//  LoanAdd.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct LoanAdd: View {
    
    @StateObject var viewModel: LoansViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New Loan")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addLoan()
                            
                            router.wrappedValue.dismiss()
                            viewModel.fetchLoans()
                            
                            viewModel.name_loan = ""
                            viewModel.loan_amount = ""
                            viewModel.payment_per_month = ""
                            viewModel.down_payment = ""
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .medium))
                        })
                        .opacity(viewModel.name_loan.isEmpty || viewModel.loan_amount.isEmpty || viewModel.payment_per_month.isEmpty || viewModel.down_payment.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.name_loan.isEmpty || viewModel.loan_amount.isEmpty || viewModel.payment_per_month.isEmpty || viewModel.down_payment.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.name_loan.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.name_loan)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Loan Amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.loan_amount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.loan_amount)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Payment per month")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.payment_per_month.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.payment_per_month)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        .padding(.bottom)
                        
                        VStack(spacing: 20) {
                            
                            HStack {
                                
                                Text("Start")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Spacer()
                                
                                DatePicker(selection: $viewModel.start, displayedComponents: .date, label: {})
                                    .labelsHidden()
                            }
                            
                            HStack {
                                
                                Text("End")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Spacer()
                                
                                DatePicker(selection: $viewModel.end, displayedComponents: .date, label: {})
                                    .labelsHidden()
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Down Payment")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.down_payment.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.down_payment)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    LoanAdd(viewModel: LoansViewModel())
}
