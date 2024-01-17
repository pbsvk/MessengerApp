//
//  ProfileView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/17/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //header
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(.systemGray))
                
                Text("Vamsi")
                    .font(.title)
                    .fontWeight(.semibold)
                
            }
            //list
            List{
                Section {
                    ForEach(0 ... 5, id: \.self) {
                        option in HStack{
                            Image(systemName: "bell.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(Color(.systemPurple))
                            Text("Notifications")
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
