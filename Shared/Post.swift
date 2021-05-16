//
//  Post.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 16/05/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let ownerImageUrl: String
    let timestamp: Timestamp
}


