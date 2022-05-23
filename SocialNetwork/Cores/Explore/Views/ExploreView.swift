//
//  ExploreView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 19/05/2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
//    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink(
                            destination: ProfileView(user: user)
                                .navigationBarHidden(true),
                            label: {
                                UserRowView(user: user)
                            })
                    }
                }
            }
        }
        .navigationTitle("Tìm kiếm")
        .navigationBarTitleDisplayMode(.inline)
//        NavigationView {
//        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
