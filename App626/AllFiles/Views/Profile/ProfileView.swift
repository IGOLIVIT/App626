//
//  ProfileView.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rider profile")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .bold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Menu(content: {
                            
                            ForEach(viewModel.Photos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                Image(systemName: "person.circle")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 32, weight: .semibold))
                                    .frame(width: 100, height: 100)
                                    .background(Circle().stroke(Color("prim"), lineWidth: 1))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(50)
                            }
                            
                        })
                        .padding(.vertical, 40)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.nameAdd.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.nameAdd)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.dateAdd.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.dateAdd)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Phone number")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.numAdd.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.numAdd)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Experiense")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.yearsAdd.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.yearsAdd)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("The name of the club")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.nickAdd.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.nickAdd)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 5))
                    .padding(5)
                }
                
                Button(action: {
                    
                    viewModel.photo = viewModel.currentPhoto
                    viewModel.name = viewModel.nameAdd
                    viewModel.date = viewModel.dateAdd
                    viewModel.num = viewModel.numAdd
                    viewModel.years = viewModel.yearsAdd
                    viewModel.nick = viewModel.nickAdd
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        viewModel.photo.removeAll()
                        viewModel.name.removeAll()
                        viewModel.date.removeAll()
                        viewModel.num.removeAll()
                        viewModel.years.removeAll()
                        viewModel.nick.removeAll()
                        
                        viewModel.currentPhoto = ""
                        viewModel.nameAdd = ""
                        viewModel.dateAdd = ""
                        viewModel.numAdd = ""
                        viewModel.yearsAdd = ""
                        viewModel.nickAdd = ""
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("tbg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ProfileView()
}
