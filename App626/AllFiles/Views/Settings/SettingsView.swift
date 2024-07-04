//
//  SettingsView.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {

                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        Text("Rate Us")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .gray.opacity(0.4), radius: 5))
                            .padding(5)
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/70dcde36-ef25-45d7-8216-801b1042c0e7") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .gray.opacity(0.4), radius: 5))
                            .padding(5)
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
