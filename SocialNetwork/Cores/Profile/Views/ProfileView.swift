//
//  ProfileView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 19/05/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFiler: ProfileFilterViewModel = .feeds
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            profileFilterBar
            
            feedsView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "namnguyen",
                               fullname: "Nam Nguyen",
                               profileImageUrl: "",
                               email: "abc@gmail.com"))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading, content: {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                })
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 32)
                
//                Circle()
//                    .frame(width: 72, height: 72)
//                    .offset(x: 16, y: 32)
            }
        })
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button(action: {
                
            }, label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            })
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Hoa rơi cửa phật")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("HCM City")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.example.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
        })
        .padding(.horizontal)
    }
    
    var profileFilterBar: some View {
        HStack {
            ForEach(ProfileFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFiler == item ? .semibold : .regular)
                        .foregroundColor(selectedFiler == item ? .black : .gray)
                    
                    if selectedFiler == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFiler = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var feedsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts(forFilter: self.selectedFiler)) { post in
                    FeedRowView(post: post)
                        .padding()
                }
            }
        }
    }
}
