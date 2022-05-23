//
//  FeedView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 19/05/2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewFeedView: Bool = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        FeedRowView(post: post)
                            .padding()
                    }
                }
            }
            
            Button(action: {
                showNewFeedView.toggle()
            }, label: {
                Image("newpost")
                    .resizable()
                    .scaledToFill()
//                    .renderingMode(.template)
                    .frame(width: 80, height: 80)
//                    .padding()
            })
//            .background(Color(.systemBlue))
//            .foregroundColor(.white)
//            .clipShape(Circle())
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            .fullScreenCover(isPresented: $showNewFeedView, onDismiss: .none, content: {
                NewPostView()
            })
        }
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
