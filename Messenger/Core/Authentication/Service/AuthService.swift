//
//  AuthService.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/26/24.
//

import SwiftUI
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session id is \(String(describing: userSession?.uid))")
    }
    
    func login(withEmail email: String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }
        catch {
            print("DEBUG: Failed to sign in user with error: \(error.localizedDescription)")
        }
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
    
    func signOut() {
        do {
            try Auth.auth().signOut() // backend signout
            self.userSession = nil // update routing logic
        } catch {
            print("DEBUG: Failed to signout with error \(error.localizedDescription)")
        }
    }
}
