//
//  ChatView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/24/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel : ChatViewModel
    let user:User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
        ScrollView {
            //header
            VStack (spacing: 4) {
                CircularProfileImageView(user: user, size: .xLarge)
                
                Text(user.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Secure Chat")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            
            //messages
            ForEach(0 ... 15, id: \.self) {
                message in ChatMessageCell(isFromCurrentUser: Bool.random())
            }
           
        }
    }
        
        //message input view
        Spacer()
        
        ZStack(alignment: .trailing) {
            TextField("Type here...", text:$viewModel.messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button {
                viewModel.sendMessage()
                viewModel.messageText = ""
            }
        label: {
            Text("Send")
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ChatView(user: User.TEST_USER)
}
