//
//  MainTabView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 25/04/21.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem{
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem{
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem{
                        Image(systemName: "heart")
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem{
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationBarTitle(tabTitle, displayMode: .inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.primary)
        }
    }
    
    var logoutButton: some View {
        Button(action: {AuthViewModel.shared.signOut()}) {
            Text("LogOut").foregroundColor(.black)
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Activity"
        case 4: return "Profile"
        default: return ""
        }
    }
}
