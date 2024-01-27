//
//  SignUpView.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/5/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                
                //Logo
           
                
                Image("messenger-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
               
                
                //Credentials with Name and phone
               
            
                
                VStack(spacing: 10){
                    TextField("Name", text: $viewModel.fullname)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .frame(width:350, height:30)
                        .cornerRadius(30)
                        .padding(.horizontal, 24)
                    TextField("Email ID", text: $viewModel.email)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .frame(width:350, height:30)
                        .cornerRadius(30)
                        .padding(.horizontal, 24)
                    SecureField("Password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .frame(width:350, height:30)
                        .cornerRadius(30)
                        .padding(.horizontal, 24)
                    TextField("Phone", text : $viewModel.number)
                        .keyboardType(.numberPad)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .frame(width:350, height:30)
                        .cornerRadius(30)
                        .padding(.horizontal, 24)
                    
                }
                
                
                //Already have an account? SIgnin
              
                
                NavigationLink {
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                    
                } label : {
                    Text("Already have an account? Login")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                }
            // Secure SignUp Button
            Spacer()
            Button{
                Task { try await viewModel.createUser() }
            } label:{
               Text("Secure Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width:360, height:30)
                    .background(Color(.systemBlue))
                    .cornerRadius(30)
                    
             
            } //or
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
            }.padding(.top, 4)
            
            
            //fb Signup
            HStack{
                Image("fb-appicon")
                    .resizable()
                    .frame(width:20, height:20)
                Text("SignUp with facebook")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.black))
            }.padding(.top, 4)
            
            
                
            }
        }
    }


struct SignUp_Previews: PreviewProvider{
    static var previews: some View{
        SignUpView()
    }
}
