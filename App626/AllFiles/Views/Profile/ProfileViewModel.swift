//
//  ProfileViewModel.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import CoreData

final class ProfileViewModel: ObservableObject {

    @AppStorage("photo") var photo: String = ""
    @AppStorage("avatar") var avatar: String = ""
    @AppStorage("name") var name: String = ""
    @AppStorage("date") var date: String = ""
    @AppStorage("num") var num: String = ""
    @AppStorage("years") var years: String = ""
    @AppStorage("nick") var nick: String = ""
    
    @Published var nameAdd = ""
    @Published var dateAdd = ""
    @Published var numAdd = ""
    @Published var yearsAdd = ""
    @Published var nickAdd = ""

    @Published var Photos: [String] = ["man"]
    @Published var currentPhoto = ""
    
    @Published var Avatars: [String] = ["flags"]
    @Published var currentAv = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false


}
