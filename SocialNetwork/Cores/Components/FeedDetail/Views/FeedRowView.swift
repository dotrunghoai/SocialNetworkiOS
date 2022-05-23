//
//  FeedRowView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 19/05/2022.
//

import SwiftUI
import Kingfisher

struct FeedRowView: View {
    @ObservedObject var viewModel: FeedRowViewModel
    
    init(post: Post) {
        self.viewModel = FeedRowViewModel(post: post)
    }
//    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.post.user {
                HStack(alignment: .top, spacing: 12, content: {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
//                    Circle()
//                        .frame(width: 56, height: 56)
//                        .foregroundColor(Color(.systemBlue))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("49w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Text(viewModel.post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                })
            }
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                })
            
                Spacer()
            
                Button(action: {
                    viewModel.post.didLike ?? false ?
                        viewModel.unlikePost() :
                        viewModel.likePost()
                }, label: {
                    Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
                })
            
                Spacer()
            
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                })
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
//        .padding()
    }
}

//struct FeedRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedRowView()
//    }
//}
