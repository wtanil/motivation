//
//  SettingViewModel.swift
//  Motivation
//
//  Created by William Tanil on 25/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import Foundation

class SettingViewModel {
    
    var manager: NotificationManager
    
    init(notificationManager: NotificationManager) {
        self.manager = notificationManager
    }
    
    func requestAuthorization() {
        manager.requestAuthorization()
    }
    
    func getAuthorizationStatus(_ completionHandler: @escaping (Bool) -> ()) {
        manager.getAuthorizationStatus(completionHandler)
    }
    
    func scheduleNotification(type: Int) {
        switch type {
            case 0:
                removeNotification()
            case 1:
                print()
                // good evening
                let message = NotificationContent(title: "Good evening!", body: "How was your day? Did you make progress towards your goal?")
                manager.scheduleNotification(identifier: "NightNotification", message: message)
                
            case 2:
                print()
                //good day
//                let message1 = NotificationContent(title: "Good day!", body: "Did you make progress towards your goal?")
//                let message2 = NotificationContent(title: "Good evening!", body: "How was your day? Did you make progress towards your goal?")
//                manager.scheduleNotification(identifier: "TomorrowDay", message: message1, timeInterval: 5)
//                manager.scheduleNotification(identifier: "TomorrowEvening", message: message2, timeInterval: 5)
                
            default:
                removeNotification()
                
        }
//        day 1 2 3 reminder
//        let message = NotificationContent(title: "Good evening!", body: "Reminder")
//        // day 1 - the day after
//        manager.scheduleNotification(identifier: "ReminderDay1", message: message, timeInterval: 5)
//        // day 2 - 2 days after not logging in
//        manager.scheduleNotification(identifier: "ReminderDay2", message: message, timeInterval: 5)
//        // day 3 - 3 days after not logging in
//        manager.scheduleNotification(identifier: "ReminderFinal", message: message, timeInterval: 5)
    }
    
    func removeNotification() {
        manager.removeNotification()
    }
}
