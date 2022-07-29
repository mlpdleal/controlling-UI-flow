//
//  ContentView.swift
//  Rolldices
//
//  Created by Manoel Leal on 29/07/22.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    
    @State private var qntSide: Int = 6
    let qntSides: [Int] = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var rollResult: Int = 0
    
    @State private var engine: CHHapticEngine?
    
    @State private var animationAmount = 1.0
    @State private var hidden = false
    @State private var results = [Int]()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var dices: FetchedResults<Dice>
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select number of sides", selection: $qntSide){
                        ForEach(qntSides, id: \.self){
                            Text("\($0) sides")
                        }
                    }
                } header: {
                    Text("Select your dice preferences")
                }
                
                Section{
                    
                    ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 300)
                                .foregroundColor(.blue)
                                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                               
                            
                            Text(rollResult == 0 ? "\(Int.random(in: 1...qntSide))" : "\(rollResult)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .opacity(hidden ? 0 : 1)
                            
                      
                            
                    }
                    .onAppear(perform: prepareHaptics)
                    .onTapGesture {
                        hidden = true
                        withAnimation(.easeInOut(duration: 2)){
                            animationAmount += 1800
                            complexSuccess()
                        }
                        withAnimation(.easeInOut(duration: 4)){
                            hidden = false
                            result()
                            let newDice = Dice(context: moc)
                            newDice.id = UUID()
                            newDice.sides = Int64(qntSide)
                            newDice.result = Int64(rollResult)
                            
                            try? moc.save()
                        }
                        
                    }

                } header: {
                    Text("Tap to roll dice!")
                }
                
                Section{
                    Text("\(dices.count)")
                } header: {
                    Text("Count: ")
                }
                
                
            }
            .navigationTitle("Row Dices")
            
        }
    }
    
    func result() {
        rollResult = Int.random(in: 1...qntSide)
    }
    
    func simpleSuccess(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func prepareHaptics(){
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do{
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess(){
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        for i in stride(from: 0, through: 1.6, by: 0.1){
            let intesity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i + 10))
            let sharpness = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i + 10))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intesity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        
        do{
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed \(error.localizedDescription)")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
