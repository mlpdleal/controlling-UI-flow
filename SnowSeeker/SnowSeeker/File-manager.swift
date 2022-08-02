//
//  File-manager.swift
//  SnowSeeker
//
//  Created by Manoel Leal on 01/08/22.
//

import Foundation

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
}
