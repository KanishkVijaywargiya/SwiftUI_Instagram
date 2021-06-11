//
//  FeedViewModel.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 16/05/21.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPost()
    }
    
    func fetchPost() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
