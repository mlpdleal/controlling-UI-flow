//
//  ContentView.swift
//  FlashzillaExample
//
//  Created by Manoel Leal on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    
    var body: some View {
        Text("Hello, world!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged{ amount in
                        currentAmount = amount - 1
                    }
                    .onEnded{ amount in
                       finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
