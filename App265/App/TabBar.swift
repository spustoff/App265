//
//  TabBar.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray.opacity(0.7))
                            .frame(width: 23, height: 23)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray.opacity(0.7))
                            .font(.system(size: 12, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 7)
        .padding(.bottom, 29)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Loans = "Loans"
    
    case Statistics = "Statistics"
    
    case Calculator = "Calculator"
    
    case Achievements = "Achievements"
}

#Preview {
    ContentView()
}
