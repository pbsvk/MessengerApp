//
//  CircularProfileImageView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/24/24.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension:CGFloat{
        switch self{
        case .xxSmall: return 25
        case.xSmall : return 32
        case.small: return 40
        case.medium : return 56
        case.large : return 64
        case.xLarge : return 80
        }
    }
}
struct CircularProfileImageView: View {
    let user : User
    let size: ProfileImageSize
    var body: some View {
        if let imageURL = user.profileImageUrl{
            Image(imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }
        else {
            Image(systemName:"person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray2))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.TEST_USER, size: .xLarge)
}
