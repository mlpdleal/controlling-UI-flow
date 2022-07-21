//
//  FileManager-DocumentDirectory.swift
//  HotProspect
//
//  Created by Manoel Leal on 20/07/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
}
