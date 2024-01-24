//
//  ChatView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/24/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
        ScrollView {
            //header
            VStack (spacing: 4) {
                CircularProfileImageView(user: User.TEST_USER, size: .xLarge)
                
                
                Text("Skullman")
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
            TextField("Type here...", text:$messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button {
                print("Send Message")}
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
    ChatView()
}
