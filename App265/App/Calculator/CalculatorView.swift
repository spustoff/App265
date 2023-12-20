//
//  CalculatorView.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Find out your monthly payment and income for a comfortable loan")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$\( Int.random(in: 1...2500))")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(.vertical, 10)
                                .frame(width: 100)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$\( Int.random(in: 1...1500))")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(.vertical, 10)
                                .frame(width: 100)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        })
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Cost of loan")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                Text("\(String(format: "%2.2f", viewModel.cost_loan))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Text("$")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.black.opacity(0.3)))
                            
                            Slider(value: $viewModel.cost_loan, in: 1000...10000, step: 1, onEditingChanged: { _ in })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Down Payment")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                Text("\(String(format: "%2.2f", viewModel.down_payment))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Text("$")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.black.opacity(0.3)))
                            
                            Slider(value: $viewModel.down_payment, in: 100...5000, step: 1, onEditingChanged: { _ in })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Loan Period")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                Text("\(String(format: "%2.2f", viewModel.loan_period))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Text("Year")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.black.opacity(0.3)))
                            
                            Slider(value: $viewModel.loan_period, in: 1...30, step: 1, onEditingChanged: { _ in })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("%")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                Text("\(String(format: "%2.2f", viewModel.percent))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Text("%")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.black.opacity(0.3)))
                            
                            Slider(value: $viewModel.percent, in: 1...15, step: 1, onEditingChanged: { _ in })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
}
