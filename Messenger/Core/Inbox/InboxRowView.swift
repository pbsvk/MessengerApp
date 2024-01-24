//
//  InboxRowView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/7/24.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircularProfileImageView(user: User.TEST_USER, size: .medium)
            
            VStack(alignment: .leading,spacing: 4){
                Text("Vamsi")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: UIScreen.main.bounds.width - 150, alignment: .leading)
                    
                
            Text("Test Message checks whether it goes into the end or not")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack{
                Text("Yesterday")
                Image(systemName: "chevron.right")
                }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height : 60)
    }
}

#Preview {
    InboxRowView()
}
