//
//  ContentViewModel.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/27/24.
//

import Firebase
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService
            in
            self?.userSession = userSessionFromAuthService
        }
        .store(in: &cancellables)
    }
}
