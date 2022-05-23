//
//  SideMenuViewModel.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 20/05/2022.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String {
        switch self {
        case .profile:
            return "Hồ sơ"
        case .lists:
            return "Danh sách"
        case .bookmarks:
            return "Ghi chú"
        case .logout:
            return "Đăng xuất"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookmarks:
            return "bookmark"
        case .logout:
            return "arrow.left.square"
        }
    }
}
