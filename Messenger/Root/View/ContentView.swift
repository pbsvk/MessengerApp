//
//  ContentView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/3/24.
//
//Getting
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            }
            else {
                LoginView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
