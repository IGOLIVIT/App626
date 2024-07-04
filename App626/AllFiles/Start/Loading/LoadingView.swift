//
//  LoadingView.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
            Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 70)
            }
            .padding()
        }
        
    }
}

#Preview {
    LoadingView()
}
