//
//  ProfileViewModel.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/20/24.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestoreSwift
@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { try await loadImage() } }
    }
    
    @Published var profileImage: Image?
    
    // Asynchronously loads and sets the profile image
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
}

