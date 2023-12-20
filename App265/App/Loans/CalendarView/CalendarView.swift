//
//  CalendarView.swift
//  App265
//
//  Created by Вячеслав on 11/28/23.
//

import SwiftUI

struct CalendarView: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
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
                .padding()
                
                DatePicker(selection: .constant(Date()), label: {})
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CalendarView()
}
