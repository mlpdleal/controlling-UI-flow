//
//  DataController.swift
//  Rolldices
//
//  Created by Manoel Leal on 29/07/22.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "Rolldices")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed \(error.localizedDescription)")
            }
        }
    }
}
