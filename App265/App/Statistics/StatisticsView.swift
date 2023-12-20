//
//  StatisticsView.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("payments") var payments: [Int] = []
    
    @State var isChart: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack(spacing: 30) {
                    
                    Circle()
                        .stroke(.gray.opacity(0.2), lineWidth: 10)
                        .frame(width: 60, height: 60)
                        .overlay (
                        
                            Text("%0")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .semibold))
                        )
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("You paid off")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("$\(payments.reduce(0, +))")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    })
                    
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                .padding([.horizontal, .top])
                
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
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(0.15)))
                .padding(.horizontal)
                .onTapGesture {
                    
                    isChart = true
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $isChart, content: {
            
            StatisticsGraph()
        })
    }
}

#Preview {
    StatisticsView()
}
