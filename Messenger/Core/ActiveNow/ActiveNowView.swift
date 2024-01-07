//
//  ActiveNowView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/7/24.
//

import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:32) {
                ForEach(0 ... 10, id: \.self) { user in
                    VStack {
                        ZStack (alignment: .bottomTrailing) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width:64, height: 64)
                                .foregroundColor(Color(.systemGray))
                            
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                Circle()
                                    .fill(.green)
                                    .frame(width: 12, height: 12)
                            }
                        }
                        Text("Vamsi")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    
                    
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
