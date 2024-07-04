//
//  Rev1.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct Rev1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Rev1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Feel like a real racer")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Rev2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 170)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .ignoresSafeArea()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Rev1()
}
