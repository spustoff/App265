//
//  AchievementsView.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct AchievementsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("No Closed Loans")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .multilineTextAlignment(.center)
                    
                    Text("Closed loans will appear here")
                        .foregroundColor(.black.opacity(0.6))
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                })
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    AchievementsView()
}
