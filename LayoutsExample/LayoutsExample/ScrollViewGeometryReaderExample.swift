//
//  ScrollViewGeometryReaderExample.swift
//  LayoutsExample
//
//  Created by Manoel Leal on 27/07/22.
//

import SwiftUI

struct ScrollViewGeometryReaderExample: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader{ fullView in
            
            ScrollView{
                ForEach(0..<50) { index in
                    GeometryReader{ geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY  - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
            
        }
    }
}

struct ScrollViewGeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewGeometryReaderExample()
    }
}
