//
//  LoanDetail.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct LoanDetail: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: LoansViewModel
    
    let index: LoansModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index.name ?? "")
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
                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            Image(systemName: "camera")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 20, weight: .regular))
                                .frame(width: 80)
                                .frame(height: 120)
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                HStack(content: {
                                    
                                    Text((index.start ?? Date()).convertDate(format: "MMM d"))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("-")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text((index.end ?? Date()).convertDate(format: "MMM d"))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("0%")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 11, weight: .regular))
                                })
                                
                                HStack {
                                    
                                    Image(systemName: "clock")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text((index.start ?? Date()).convertDate(format: "MMM d"))
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                Text("$\(index.payment_month)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 19, weight: .semibold))
                                
                                HStack {
                                    
                                    Text("Education")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                }
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                        
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Down payment")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("$\(index.down_payment)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .regular))
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Loan amount")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("$\(index.loan_amount)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .regular))
                            })
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("History payments")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ForEach(viewModel.payments, id: \.self) { index in
                            
                                HStack {
                                    
                                    Text((Date()).convertDate(format: "MMM d"))
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("$\(index)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .regular))
                                }
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                    }
                    .padding([.horizontal, .bottom])
                }
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isPayment = true
                    }
                    
                }, label: {
                    
                    Text("New Payment")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isPayment ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isPayment = false
                        }
                        
                        UIApplication.shared.endEditing()
                    }
                
                VStack {
                    
                    ZStack {
                        
                        Text("Payment")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        HStack {
                            
                            Button(action: {
                                
                                UIApplication.shared.endEditing()
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isPayment = false
                                }
                                
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
                                
                                UIApplication.shared.endEditing()
                                
                                viewModel.payments.append(Int(viewModel.payment_amount) ?? 0)
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isPayment = false
                                }
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 18, weight: .medium))
                            })
                            .opacity(viewModel.payment_amount.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.payment_amount.isEmpty ? true : false)
                        }
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Payment Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.payment_amount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.payment_amount)
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .keyboardType(.decimalPad)
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    .padding(.top)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isPayment ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

//#Preview {
//    LoanDetail(viewModel: LoansViewModel())
//}
