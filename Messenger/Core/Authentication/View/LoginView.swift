//
//  LoginView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/4/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                //Brand logo
                Image("messenger-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                
                // Credentials
                let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
                VStack(spacing: 10){
                    TextField("Email ID", text: $email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(skyBlue))
                        .cornerRadius(20)
                        .padding(.horizontal, 24)
                    SecureField("Password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(skyBlue))
                        .cornerRadius(20)
                        .padding(.horizontal, 24)
                }
                
                
                //forgot pass ?
                Button{
                print("Forgot Password Handle")
                } label : {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                
                //login
                Button {
                    print("Handle Login")
                } label: {
                    Text("Secure Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 40)
                        .background(Color(.systemBlue))
                        .cornerRadius(20)
                        
                }.padding(.vertical)
                
                //or
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2)-40, height: 0.6)
                        .foregroundColor(.gray)

                    Text("or")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2)-40, height: 0.6)
                        .foregroundColor(.gray)
                }
                
                //fb login
                HStack{
                    Image("fb-appicon")
                        .resizable()
                        .frame(width:20, height:20)
                    Text("Login with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.black))
                }.padding(.top, 8)
                Spacer()
                
                
                //signup link
                Divider()
                NavigationLink {
                    SignUpView()
                    

                }
            label:{
                HStack(spacing : 3){
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    
                }.font(.footnote)
                    .padding(.vertical)
                }
            }
        }
    }
}

struct Login_View_Previews: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
}
