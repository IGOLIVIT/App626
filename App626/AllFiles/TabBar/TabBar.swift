//
//  TabBar.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
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
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim2") : Color("prim2").opacity(0.4))
                            .frame(width: 25, height: 25)

                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 58)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Profile = "Profile"
    
    case Races = "Races"
    
    case Notes = "Notes"
            
    case Settings = "Settings"
    
}
