//
//  LoginView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 21/05/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Xin chào.", title2: "Bạn đã trở lại")
            
            VStack(spacing: 40) {
//                TextField("Email", text: $email)
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                
//                TextField("Mật khẩu", text: $password)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Mật khẩu",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Text("Quên mật khẩu?")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemBlue))
                                .padding(.top)
                                .padding(.trailing, 24)
                        })
                })
            }
            
            Button(action: {
                viewModel.login(withEmail: email, password: password)
            }, label: {
                Text("Đăng nhập")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            })
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            NavigationLink(
                destination: RegisterView()
                    .navigationBarHidden(true),
                label: {
                    HStack {
                        Text("Bạn chưa có tài khoản ?")
                            .font(.footnote)
                        
                        Text("Đăng ký")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                })
                .padding(.bottom, 32)
                .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
