//
//  UserListView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 27/04/21.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    @Binding var searchText: String
    
    var user: [User]{
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUser(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(user) { user in
                    NavigationLink(destination: ProfileView(user: user) ) {
                        UserCell(user: user)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}
