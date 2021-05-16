//
//  SearchViewModel.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 13/05/21.
//

import Firebase
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUser()
    }
    
    // fetching users
    func fetchUser() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }
    
    func filteredUser(_ query: String) -> [User] {
        let lowerCasedQuery = query.lowercased()
        return users.filter(
            {
                $0.fullname.lowercased().contains(lowerCasedQuery) ||
                    $0.username.lowercased().contains(lowerCasedQuery)
            }
        )
    }
}
