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
    var body: some View {
        VStack {
            //header
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                
                Text("Chris")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .onChange(of: viewModel.selectedItem) { newItem, _ in
                if newItem == nil {
                    // Only update the profile image if a new item is selected
                    viewModel.clearProfileImage()
                }
            }
            //list
            List{
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in HStack{
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
                        
                    }
                    Button("Delete Account") {
                        
                    }.foregroundColor(.red)
                }
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
