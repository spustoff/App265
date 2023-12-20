//
//  LoadingView.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .background(Circle().fill(Color("primary")).shadow(color: Color("primary"), radius: 30, x: 0, y: 0).blur(radius: 80))
        }
    }
}

#Preview {
    LoadingView()
}
