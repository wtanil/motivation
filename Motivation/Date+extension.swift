//
//  Date+extension.swift
//  Motivation
//
//  Created by William Tanil on 13/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import Foundation

extension Date {
    static let startOfDate: Date = {
        return Calendar.current.startOfDay(for: Date())
    }()
    
    static let endOfDate: Date = {
        let calendar = Calendar.current
        let startOfDate = Calendar.current.startOfDay(for: Date())
        return calendar.date(byAdding: .day, value: 1, to: startOfDate) ?? Date()
    }()
    
    static let oneYearAgoDate: Date = {
        return Calendar.current.date(byAdding: .year, value: -1, to: Date()) ?? Date()
    }()
    
    static func isToday(_ date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
    }
    
    static func convertDateToInterval(_ date: Date) -> TimeInterval {
        date.timeIntervalSinceReferenceDate
    }
    
    static func convertIntervalToDate(_ timeInterval: TimeInterval) -> Date {
        Date(timeIntervalSinceReferenceDate: timeInterval)
    }
    
    // by default return Today 22.00
    static func getTodayDate(_ hour: Int = 20) -> Date {
        let calendar = Calendar.current
        let startOfDate = Calendar.current.startOfDay(for: Date())
        return calendar.date(byAdding: .hour, value: hour, to: startOfDate) ?? Date()
    }
    
    static func getDateComponent(from date: Date) -> DateComponents {
        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
    }
    
}
