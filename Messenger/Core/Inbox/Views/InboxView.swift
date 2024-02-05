//
//  InboxView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/7/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage

struct InboxView: View {
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser : User?
    @State private var showChat = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
                List {
                    ActiveNowView()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical)
                        .padding(.horizontal, 4)
                    ForEach(viewModel.recentMesages) {
                        message in 
                        ZStack {
                            NavigationLink(value : message) {
                                EmptyView()
                            }.opacity(0.0)
                            InboxRowView(message: message)
                        }
                    }
                }.listStyle(PlainListStyle())
                   
            
            .onChange(of: selectedUser, perform:{newValue in
            showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: {message in
                if let user = message.user {
                    ChatView(user: user)
                }})
            .navigationDestination(for: User.self, destination: {user in
                
                ProfileView( user: user)
            })
            
            .navigationDestination(isPresented: $showChat, destination:{ if let user = selectedUser{
                ChatView(user: user)
            }
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView( selectedUser: $selectedUser)
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user){
                            CircularProfileImageView(user: user, size:.small)
                        }
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                        selectedUser = nil
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
