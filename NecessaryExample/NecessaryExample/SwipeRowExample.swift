//
//  SwipeRowExample.swift
//  NecessaryExample
//
//  Created by Manoel Leal on 17/07/22.
//

import SwiftUI

struct SwipeRowExample: View {
    var body: some View {
        List{
            Text("Taylor Swift")
                .swipeActions{
                    Button(role: .destructive){
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading){
                    Button{
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct SwipeRowExample_Previews: PreviewProvider {
    static var previews: some View {
        SwipeRowExample()
    }
}
