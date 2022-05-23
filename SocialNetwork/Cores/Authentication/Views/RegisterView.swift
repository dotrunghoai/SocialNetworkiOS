//
//  RegisterView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 21/05/2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: {})
            
            AuthHeaderView(title1: "Bắt đầu.", title2: "Tạo tài khoản của bạn")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeholderText: "Tên tài khoản", text: $username)
                
                CustomInputField(imageName: "person", placeholderText: "Họ và tên", text: $fullname)
                
                CustomInputField(imageName: "lock", placeholderText: "Mật khẩu", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button(action: {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label: {
                Text("Đăng ký")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            })
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Text("Bạn đã có tài khoản ?")
                        .font(.footnote)
                    
                    Text("Đăng nhập")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            })
            .padding(.bottom, 32)
//            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
