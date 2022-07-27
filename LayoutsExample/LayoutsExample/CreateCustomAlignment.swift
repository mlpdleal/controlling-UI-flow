//
//  CreateCustomAlignment.swift
//  LayoutsExample
//
//  Created by Manoel Leal on 26/07/22.
//

import SwiftUI

extension VerticalAlignment{
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
        
        
    }
    
    static let midAccountName = VerticalAlignment(MidAccountAndName.self)
}

struct CreateCustomAlignment: View {
    var body: some View {
    
        HStack(alignment: .midAccountName){
            VStack{
                Text("@mlpdleal")
                    .alignmentGuide(.midAccountName) { d in d[VerticalAlignment.center]}
                Image("manoel-leal")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack{
                Text("Full name:")
                Text("MANOEL LEAL")
                    .alignmentGuide(.midAccountName) { d in d[VerticalAlignment.center]}
                    .font(.largeTitle)
            }
        }
    }
}

struct CreateCustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        CreateCustomAlignment()
    }
}
