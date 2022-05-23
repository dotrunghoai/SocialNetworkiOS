//
//  FeedRowViewModel.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 22/05/2022.
//

import Foundation

class FeedRowViewModel: ObservableObject {
    @Published var post: Post
    private let service = FeedService()
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    func likePost() {
        service.likePost(post) {
            self.post.didLike = true
        }
    }
    
    func unlikePost() {
        service.unlikePost(post) {
            self.post.didLike = false
        }
    }
    
    func checkIfUserLikedPost() {
        service.checkIfUserLikedPost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
        }
    }
}
