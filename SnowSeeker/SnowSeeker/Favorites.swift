//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Manoel Leal on 01/08/22.
//

import Foundation

class Favorites: ObservableObject {
    
    private var resorts: Set<String>
    //private let saveKey: String = "Favorites"
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Favorites")
    
    init(){
        do {
            let data = try Data(contentsOf: savePath)
            resorts = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch{
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool{
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort){
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort){
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
}
