//
//  NotesViewModel.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import CoreData

final class NotesViewModel: ObservableObject {

    @Published var isAddNote: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var addNote = ""
    @AppStorage("notes") var notes: [String] = []


}
