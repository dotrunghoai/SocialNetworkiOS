//
//  ProfilePhotoSelectorView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 21/05/2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Cập nhật tài khoản.", title2: "Thêm ảnh đại diện")
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                } else {
                    Image("ic-plus") //person.badge.plus // person.crop.circle.badge.plus
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            })
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                ImagePicker(selectedImage: $selectedImage)
            })
            .padding(.top, 44)
            
            if let selectedImage = selectedImage {
                Button(action: {
                    viewModel.uploadProfileImage(selectedImage)
                }, label: {
                    Text("Tiếp tục")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 180)
//           .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
