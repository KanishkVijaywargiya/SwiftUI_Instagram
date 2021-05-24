//
//  Notification.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 24/05/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Codable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var isFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your post."
        case .follow: return " started following you."
        }
    }
}
