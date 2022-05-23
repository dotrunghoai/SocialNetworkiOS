//
//  ProfileViewModel.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 22/05/2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var likedPost = [Post]()
    
    private let service = FeedService()
    private let userService = UserService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserPosts()
        self.fetchLikedPost()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Chỉnh sửa hồ sơ" : "Theo dõi"
    }
    
    func posts(forFilter filter: ProfileFilterViewModel) -> [Post] {
        switch filter {
        case .feeds:
            return posts
        case .replies:
            return posts
        case .likes:
            return likedPost
        }
    }
    
    func fetchUserPosts() {
        guard let uid = user.id else { return }
        service.fetchPosts(forUid: uid) { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                self.posts[i].user = self.user
            }
        }
    }
    
    func fetchLikedPost() {
        guard let uid = user.id else { return }
        service.fetchLikedPost(forUid: uid) { posts in
            self.likedPost = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedPost[i].user = user
                }
            }
        }
    }
}
