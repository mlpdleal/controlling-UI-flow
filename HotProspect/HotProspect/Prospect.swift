//
//  Prospect.swift
//  HotProspect
//
//  Created by Manoel Leal on 18/07/22.
//

import SwiftUI

class Prospect: Identifiable, Codable{
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var date = Date.now
    fileprivate(set) var isContacted = false
    
}

@MainActor class Prospects: ObservableObject{
    @Published private(set) var people: [Prospect]
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
                
        do{
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
        
    }
    
    private func save() {

        do{
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch{
            print("Unable to save data.")
        }
        
    }
    

    
    func toggle(_ prospect: Prospect){
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect){
        people.append(prospect)
        save()
    }
}
