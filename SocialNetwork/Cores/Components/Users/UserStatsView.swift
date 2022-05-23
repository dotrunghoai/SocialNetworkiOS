//
//  UserStatsView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 20/05/2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("809")
                    .font(.subheadline)
                    .bold()
                
                Text("Đang theo dõi")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("1.2Tr")
                    .font(.subheadline)
                    .bold()
                
                Text("Người theo dõi")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
