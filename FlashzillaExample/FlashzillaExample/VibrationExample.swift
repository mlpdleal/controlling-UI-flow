//
//  VibrationExample.swift
//  FlashzillaExample
//
//  Created by Manoel Leal on 21/07/22.
//

import CoreHaptics
import SwiftUI

struct VibrationExample: View {
    
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: prepareHaptics)
            .onTapGesture(perform: complexSuccess)
            
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
        for i in stride(from: 0, through: 1, by: 0.1){
            let intesity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intesity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, through: 1, by: 0.1){
            let intesity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intesity, sharpness], relativeTime: 1 + i)
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

struct VibrationExample_Previews: PreviewProvider {
    static var previews: some View {
        VibrationExample()
    }
}
