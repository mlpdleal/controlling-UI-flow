//
//  ContentView.swift
//  SupportingSpecificAccessibility
//
//  Created by Manoel Leal on 22/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack{
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
