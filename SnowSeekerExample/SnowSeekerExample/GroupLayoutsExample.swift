//
//  GroupLayoutsExample.swift
//  SnowSeekerExample
//
//  Created by Manoel Leal on 30/07/22.
//

import SwiftUI


struct UserView: View{
    var body: some View{
        Group{
            Text("Name: Paul Hudson")
            Text("Country: UK")
            Text("Pets: Luna and Arya")
        }
    }
}

struct GroupLayoutsExample: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact{
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

struct GroupLayoutsExample_Previews: PreviewProvider {
    static var previews: some View {
        GroupLayoutsExample()
    }
}
