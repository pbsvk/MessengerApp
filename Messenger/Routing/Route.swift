//
//  Route.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 2/6/24.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
