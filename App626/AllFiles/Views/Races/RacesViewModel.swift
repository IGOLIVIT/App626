//
//  RacesViewModel.swift
//  App626
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import CoreData

final class RacesViewModel: ObservableObject {
    
    @Published var photos: [String] = ["Race1", "Race2"]
    @Published var currentPhoto = ""
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false
    
    @AppStorage("categoties") var categories: [String] = ["All"]
    @Published var category = ""
    @Published var categoryToAdd = ""
    @Published var currentCategory = "All"
    
    @Published var racePhoto = ""
    @Published var raceCat = ""
    @Published var raceName = ""
    @Published var raceDate = ""
    @Published var raceLoc = ""

    @Published var races: [RaceModel] = []
    @Published var selectedRace: RaceModel?
    
    func addRace() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RaceModel", into: context) as! RaceModel
        
        loan.racePhoto = racePhoto
        loan.raceCat = raceCat
        loan.raceName = raceName
        loan.raceDate = raceDate
        loan.raceLoc = raceLoc

        CoreDataStack.shared.saveContext()
    }
    
    func fetchRaces() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RaceModel>(entityName: "RaceModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.races = result.filter{($0.raceCat ?? "") == currentCategory}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.races = []
        }
    }
}
