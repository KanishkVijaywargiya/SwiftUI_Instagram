//
//  SearchView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 25/04/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            // grid view/ user list view
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}