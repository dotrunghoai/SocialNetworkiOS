//
//  ProfileFilterViewModel.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 19/05/2022.
//

import Foundation

enum ProfileFilterViewModel: Int, CaseIterable {
    case feeds
    case replies
    case likes
    
    var title: String {
        switch self {
        case .feeds:
            return "Dòng thời gian"
        case .replies:
            return "Trả lời"
        case .likes:
            return "Thích"
        }
    }
}
