//
//  GeometryReaderExample.swift
//  LayoutsExample
//
//  Created by Manoel Leal on 27/07/22.
//

import SwiftUI

struct OuterView: View{
    var body: some View{
        VStack{
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View{
    var body: some View{
        HStack{
            Text("Left")
            
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                        print("Custom center: \(geo.frame(in: .named("custom")).midX) x \(geo.frame(in: .named("custom")).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct GeometryReaderExample: View {
    var body: some View {
        
       OuterView()
            .background(.red)
            .coordinateSpace(name: "custom")
    }
}

struct GeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
