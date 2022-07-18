//
//  PackageExample.swift
//  NecessaryExample
//
//  Created by Manoel Leal on 17/07/22.
//

import SwiftUI
import SamplePackage

struct PackageExample: View {
    
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String{
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.joined(separator: ", ")
    }
}

struct PackageExample_Previews: PreviewProvider {
    static var previews: some View {
        PackageExample()
    }
}
