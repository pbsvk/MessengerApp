//
//  ProfileView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/17/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            // header
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        if let imageUrl = user.profileImageUrl,
                           let url = URL(string: imageUrl),
                           let data = try? Data(contentsOf: url),
                           let uiImage = UIImage(data: data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } else {
                            Image(user.profileImageUrl ?? "")
                                                       .resizable()
                                                       .scaledToFill()
                                                       .frame(width: 80, height: 80)
                                                       .clipShape(Circle())
                        }
                    }
                }
                
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            // list
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                Section {
                    Button("Sign Out") {
                        AuthService.shared.signOut()
                    }
                    Button("Delete Account") {
                        
                    }.foregroundColor(.red)
                }
            }
            
        }
    }
}

#Preview {
    ProfileView(user:User.TEST_USER)
}
