//
//  InboxView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/7/24.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var user = User.TEST_USER
    
    var body: some View {
        NavigationStack{
            ScrollView{
            ActiveNowView()
                List {
                    ForEach(0 ... 10, id : \.self) {
                        message in InboxRowView()
                    }
                }.listStyle(PlainListStyle())
                    .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self, destination: {user in ProfileView( user: user)})
            .fullScreenCover(isPresented: $showNewMessageView, content: {
               NewMessageView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user){
                            Image(user.profileImageUrl ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width:32, height:32)
                                .clipShape(Circle())
                        }
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray6))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
