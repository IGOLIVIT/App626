//
//  RacesView.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct RacesView: View {
    
    @StateObject var viewModel = RacesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("List of races")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 60, height: 45)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(Color("prim2")))
                                .padding(1)
                        })
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategory = index
                                viewModel.fetchRaces()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.horizontal)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(viewModel.currentCategory == index ? Color("prim2") : Color("prim2").opacity(0.5)))
                            })
                        }
                    }
                }
                .frame(height: 60)
                
                if viewModel.races.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image("EmptyRace")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180)
                        
                        HStack {
                            
                            Text("Add a new race")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                                    .padding(.horizontal)
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 5))
                    .padding(5)
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.races, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedRace = index
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Image(index.racePhoto ?? "")
                                            .resizable()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 150)
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 12) {
                                                
                                                Text(index.raceCat ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(3)
                                                    .padding(.horizontal, 2)
                                                    .background(RoundedRectangle(cornerRadius: 4).fill(.white))
                                                
                                                Text(index.raceName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 20, weight: .medium))
                                                
                                                Text(index.raceDate ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.raceLoc ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                            
                                            Spacer()
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Create a category")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Category")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.category.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.category)
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
                        
                        viewModel.categories.append(viewModel.category)
                        
                        viewModel.category = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                    })
                    .opacity(viewModel.category.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.category.isEmpty ? true : false)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isAddCat ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchRaces()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRace(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RaceDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    RacesView()
}
