//
//  LoansView.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct LoansView: View {
    
    @StateObject var viewModel = LoansViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        CalendarView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 23, weight: .medium))
                    })
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 23, weight: .medium))
                    })
                }
                .padding()
                
                if viewModel.loans.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("No Loans")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Text("Added loans will appear here")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            viewModel.isAdd = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("New loan")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding()
                            .padding(.horizontal, 40)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                            .padding(.top)
                        })
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.loans, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedLoan = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
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
                                            
                                            Text("$\(index.down_payment)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 19, weight: .semibold))
                                            
                                            HStack {
                                                
                                                Text("Education")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(Color("primary"))
                                                    .font(.system(size: 17, weight: .regular))
                                                    .padding(7)
                                                    .background(Circle().fill(Color("primary").opacity(0.4)))
                                            }
                                        })
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            LoanAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedLoan {
                
                LoanDetail(viewModel: viewModel, index: index)
            }
        })
        .onAppear {
            
            viewModel.fetchLoans()
        }
    }
}

#Preview {
    LoansView()
}
