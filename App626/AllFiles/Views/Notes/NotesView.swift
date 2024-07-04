//
//  NotesView.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddNote = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Your notes")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 17) {
                        
                        ForEach(viewModel.notes, id: \.self) { index in
                            
                            VStack {
                                
                                HStack {
                                    
                                    Circle()
                                        .stroke(.black)
                                        .frame(width: 17)
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(.horizontal)
                                    
                                    Spacer()
                                }
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddNote ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddNote = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddNote = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Create a note")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Text")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addNote.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addNote)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim2")))
                    .padding(1)
                    .padding(.bottom)
                    
                    Button(action: {
          
                        viewModel.notes.append(viewModel.addNote)
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddNote = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                    })
                    .opacity(viewModel.addNote.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.addNote.isEmpty ? true : false)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isAddNote ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    NotesView()
}
