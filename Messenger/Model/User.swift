//
//  User.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/20/24.
//

import Foundation
import SwiftUI
import _PhotosUI_SwiftUI

struct User: Codable, Identifiable, Hashable {
    var id = UUID()
    let fullName: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let TEST_USER = User(fullName: "Skullman", email: "skullerson@gmail.com", profileImageUrl: "profilePic")
}

// Create a protocol for the data source
protocol ProfileDataSource: ObservableObject {
    var selectedItem: PhotosPickerItem? { get set }
    var profileImage: Image? { get set }
}

// Create a concrete implementation of the data source for preview
class MockProfileDataSource: ObservableObject, ProfileDataSource {
    @Published var selectedItem: PhotosPickerItem?
    @Published var profileImage: Image?

    init() {
        // Set default values for preview
        // Replace with the actual data you want to show in the canvas preview
        if let selectedImage = UIImage(named: "profilePic") {
            let imageData = selectedImage.jpegData(compressionQuality: 1.0)
            let uiImage = UIImage(data: imageData!)
            self.profileImage = Image(uiImage: uiImage!)
        }
    }
}
