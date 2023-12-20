//
//  StatisticsGraph.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct StatisticsGraph: View {
    
    @Environment(\.presentationMode) var router
    
    @State var current_pair: String = "EURUSD"
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(current_pair)
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
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("\(Int.random(in: 1...234955))")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .regular))
                        
                        Text("EUR/USD")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Image("graph")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Menu {
                    
                    ForEach(["EURUSD", "EURTRY", "EURKZT", "EURRUB"], id: \.self) { index in
                    
                        Button(action: {
                            
                            current_pair = index
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(index)
                                
                                Spacer()
                                
                                if current_pair == index {
                                    
                                    Image(systemName: "xmark")
                                }
                            }
                        })
                    }
                    
                } label: {
                    
                    HStack {
                        
                        Text(current_pair)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                }
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.green))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.red))
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    StatisticsGraph()
}
