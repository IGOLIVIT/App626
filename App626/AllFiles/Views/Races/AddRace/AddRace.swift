//
//  AddRace.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import CoreData

struct AddRace: View {
    
    @StateObject var viewModel: RacesViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Add a race")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 36, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 140)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim2"), lineWidth: 2))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 140)
                            }
                        })
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {

                                ForEach(viewModel.categories, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.categoryToAdd = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                            .padding(.horizontal)
                                            .frame(height: 45)
                                            .background(RoundedRectangle(cornerRadius: 12).fill(viewModel.categoryToAdd == index ? Color("prim2") : Color("prim2").opacity(0.5)))
                                    })
                                }
                            }
                        }
                        .frame(height: 60)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.raceName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.raceName)
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
                                .opacity(viewModel.raceDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.raceDate)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Location")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.raceLoc.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.raceLoc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                }
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim2")))
                    })
                    
                    Button(action: {
                        
                        viewModel.racePhoto = viewModel.currentPhoto
                        viewModel.raceCat = viewModel.categoryToAdd
                        
                        viewModel.addRace()
                        
                        viewModel.categoryToAdd = ""
                        viewModel.currentPhoto = ""
                        viewModel.raceName = ""
                        viewModel.raceDate = ""
                        viewModel.raceLoc = ""
                        
                        viewModel.fetchRaces()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddRace(viewModel: RacesViewModel())
}
