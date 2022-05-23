//
//  UploadPostViewModel.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 22/05/2022.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    @Published var didUploadPost = false
    
    let service = FeedService()
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { isSuccess in
            if isSuccess {
                self.didUploadPost = true
            } else {
                
            }
        }
    }
}
