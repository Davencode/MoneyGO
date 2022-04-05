//
//  Goals.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!

struct Goals: Identifiable {
    let id: UUID
    var title: String
    var value: Int
    var date: Date
    var priority: Priority
    var color: Color
    
    init(id: UUID = UUID(), title: String, value: Int, date: Date, priority: Priority, color: Color) {
        self.id = id
        self.title = title
        self.value = value
        self.date = date
        self.priority = priority
        self.color = color
    }
    
    func needToSave() -> Double {
        let interval = (date - Date()).day! + 1
        return Double(value) / Double(interval)
    }
    
    enum Priority: String, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
}

extension Date {
    
    static func -(recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second
        
        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
    
}

extension Goals {
    static var data: [Goals] {
        [
//            Goals(title: "Get out of debt", value: 1000, date: tomorrow, priority: .high, color: .red),
//            Goals(title: "Start saving", value: 100, date: tomorrow, priority: .medium, color: .yellow),
//            Goals(title: "Start investing", value: 10, date: tomorrow, priority: .low, color: .green)
        ]
    }
}

extension Goals {
    struct Data {
        var title: String = ""
        var value: Double = 0.0
        var date: Date = tomorrow
        var priority: Priority = .medium
        var color: Color = .orange
    }
    
    var data: Data {
        return Data(title: title, value: Double(value), date: date, priority: priority, color: color)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        value = Int(data.value)
        date = data.date
        priority = data.priority
        color = data.color
    }
}
