//
//  ContentView.swift
//  NecessaryExample
//
//  Created by Manoel Leal on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change color")
                .padding()
                .contextMenu{
                    Button("Red"){
                        backgroundColor = .red
                    }
                    
                    Button("Green"){
                        backgroundColor = .green
                    }
                    
                    Button("Blue"){
                        backgroundColor = .blue
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
