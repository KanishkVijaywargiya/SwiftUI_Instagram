//
//  MainTabView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 25/04/21.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem{
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                UploadPostView()
                    .tabItem{
                        Image(systemName: "plus.square")
                    }
                NotificationsView()
                    .tabItem{
                        Image(systemName: "heart")
                    }
                ProfileView(user: user)
                    .tabItem{
                        Image(systemName: "person")
                    }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.primary)
        }
    }
    
    var logoutButton: some View {
        Button(action: {AuthViewModel.shared.signOut()}) {
            Text("LogOut").foregroundColor(.black)
        }
    }
}
