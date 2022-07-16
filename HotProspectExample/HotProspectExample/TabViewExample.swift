//
//  TabViewExample.swift
//  HotProspectExample
//
//  Created by Manoel Leal on 16/07/22.
//

import SwiftUI

struct TabViewExample: View {
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem{
                    Label("One", systemImage: "star")
                }
            Text("Tab 2")
                .tabItem{
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
