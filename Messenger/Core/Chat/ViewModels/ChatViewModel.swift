//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/28/24.
//

import Foundation


class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    init(user: User) {
        self.user = user
    }
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
