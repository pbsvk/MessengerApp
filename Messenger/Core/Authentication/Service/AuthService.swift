//
//  AuthService.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/26/24.
//

import SwiftUI
import Firebase

class AuthService {
    
    func login(withEmail email: String, password:String) async throws {
        print("DEBUG: EMAIL is \(email)")
        print("DEBUG: PASSWORD is \(password)")
    }
    
    func createUser(withEmail email: String, password:String, fullname:String, number:String ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Create user \(result.user.uid)")
        }
        catch
        {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
}
