//
//  ContentView.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Profile

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        ProfileView()
                            .tag(Tab.Profile)

                        RacesView()
                            .tag(Tab.Races)
                        
                        NotesView()
                            .tag(Tab.Notes)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                Rev1()
            }
        }
    }
}

#Preview {
    ContentView()
}
