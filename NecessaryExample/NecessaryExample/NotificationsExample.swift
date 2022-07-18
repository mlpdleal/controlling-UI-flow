//
//  NotificationsExample.swift
//  NecessaryExample
//
//  Created by Manoel Leal on 17/07/22.
//

import SwiftUI
import UserNotifications

struct NotificationsExample: View {
    var body: some View {
        VStack{
            Button("Request permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
                    if success{
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification"){
                let content = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They look hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct NotificationsExample_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsExample()
    }
}
