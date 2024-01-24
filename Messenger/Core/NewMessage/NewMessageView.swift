//
//  NewMessageView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/8/24.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView{
                TextField("To: ", text: $searchText)
                    .autocapitalization(.none) 
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                ForEach(0 ... 10, id: \.self) {
                    user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: User.TEST_USER, size: .small)
                            
                            Text("User")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }.padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                   
                }
                
            }.navigationTitle("New Message")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .foregroundColor(.black)
                    }
                    
            }
        }
    }
}

#Preview {
    NavigationStack{
        NewMessageView()
    }
}
