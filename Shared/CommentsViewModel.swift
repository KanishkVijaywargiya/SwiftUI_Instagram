//
//  CommentsViewModel.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 22/05/21.
//

import Foundation
import Firebase

class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    private let post: Post
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        
        let data : [String: Any] = ["username": user.username,
                                    "profileImageUrl": user.profileImageUrl,
                                    "uid": user.id ?? "",
                                    "timestamp": Timestamp(date: Date()),
                                    "postOwnerUid": post.ownerUid,
                                    "commentText": commentText
        ]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("Debug: Error uploading comment \(error.localizedDescription)")
                return
            }
            
            self.fetchComments()
            
            NotificationsViewModel.uploadNotifications(toUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }
    
    func fetchComments() {
        guard let postId = post.id else { return }
        
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: true)
        
        // higher order function in swift
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments = addedDocs.compactMap({
                try? $0.document.data(as: Comment.self)
            })
        }
    }
}
