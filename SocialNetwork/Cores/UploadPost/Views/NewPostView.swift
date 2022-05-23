//
//  NewPostView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 21/05/2022.
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    @State private var caption: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Huỷ")
                        .foregroundColor(Color(.systemBlue))
                })
                
                Spacer()
                
                Button(action: {
                    viewModel.uploadPost(withCaption: caption)
                }, label: {
                    Text("Đăng")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                }
//                Circle()
//                    .frame(width: 64, height: 64)
                
                TextArea("Bạn đang nghĩ gì ?", text: $caption)
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadPost, perform: { isSuccess in
            if isSuccess {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
