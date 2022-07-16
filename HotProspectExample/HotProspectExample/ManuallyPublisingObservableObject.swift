//
//  ManuallyPublisingObservableObject.swift
//  HotProspectExample
//
//  Created by Manoel Leal on 16/07/22.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject{
    var value = 0 {
        willSet{
            objectWillChange.send()
        }
    }
    
    init(){
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)){
                self.value += 1
            }
            
        }
    }
}

struct ManuallyPublisingObservableObject: View {
    
    @StateObject private var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct ManuallyPublisingObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublisingObservableObject()
    }
}
