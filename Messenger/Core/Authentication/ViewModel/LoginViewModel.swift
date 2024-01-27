//
//  LoginViewModel.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/26/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
      try await  AuthService().login(withEmail: email, password: password)
    }
}
