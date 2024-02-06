//
//  Date.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 2/6/24.
//

import Foundation

extension Date {
    private var timeFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    private func timeString() -> String {
        return timeFormatter.string(from: self)
    }
    
    private func dateString() -> String {
        return dayFormatter.string(from: self)
    }
     func timestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return timeString()
        }else if Calendar.current.isDateInYesterday(self){
            return "Yesterday"
        } else {
            return dateString()
        }
    }
    
}

