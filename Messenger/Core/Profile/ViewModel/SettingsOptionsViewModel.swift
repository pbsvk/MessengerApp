//
//  SettingsOptionsViewModel.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/17/24.
//

import SwiftUI
enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var title: String{
        switch self {
            
        case .darkMode:
            return "Dark Mode"
        case .activeStatus:
            return "Active Status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy and Safety"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName : String{
        switch self {
            
        case .darkMode:
            return "moon.fill"
        case .activeStatus:
            return "message.badge.fill"
        case .accessibility:
            return "person.fill"
        case .privacy:
            return "lock.fill"
        case .notifications:
            return "bell.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
            
        case .darkMode:
            return Color.black
        case .activeStatus:
            return Color(.systemGreen)
        case .accessibility:
            return Color.black
        case .privacy:
            return Color(.systemBlue)
        case .notifications:
            return Color(.systemPurple)
        }
    }
    var id: Int { return self.rawValue }
}
