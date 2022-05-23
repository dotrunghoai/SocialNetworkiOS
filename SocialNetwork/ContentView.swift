//
//  ContentView.swift
//  SocialNetwork
//
//  Created by Đỗ Trung Hoài on 17/05/2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
//                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Trang chủ")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                if let _ = viewModel.currentUser {
                    Button(action: {
//                        print(user)
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "person")
                        
//                        KFImage(URL(string: user.profileImageUrl))
//                            .resizable()
//                            .scaledToFill()
//                            .clipShape(Circle())
//                            .frame(width: 32, height: 32)
//                            .background(Color.red)
                        
//                        Circle()
//                            .frame(width: 32, height: 32)
//                            .foregroundColor(.gray)
                    })
                }
            }
        })
        .onAppear(perform: {
            showMenu = false
        })
    }
}
