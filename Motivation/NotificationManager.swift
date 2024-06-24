//
//  NotificationManager.swift
//  Motivation
//
//  Created by William Tanil on 24/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("success")
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func getAuthorizationStatus(_ completionHandler: @escaping (Bool) -> ()) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            let status = settings.authorizationStatus
            let isAuthorized = status == .authorized
            completionHandler(isAuthorized)
        }
    }
    
    func scheduleNotification(message: NotificationContent) {
        let content = UNMutableNotificationContent()
        content.title = message.title
        content.subtitle = message.subtitle
        content.body = message.body
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
        
    }
    
    func removeNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    
    	
    
}
