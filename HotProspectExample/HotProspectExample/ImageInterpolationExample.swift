//
//  ImageInterpolationExample.swift
//  HotProspectExample
//
//  Created by Manoel Leal on 16/07/22.
//

import SwiftUI
import UserNotifications

struct ImageInterpolationExample: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ImageInterpolationExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolationExample()
    }
}
