//
//  UserRowView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 20/05/2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
//            Circle()
//                .frame(width: 48, height: 48)
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                
                Text("@\(user.username)")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
