//
//  Post.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 22/05/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
