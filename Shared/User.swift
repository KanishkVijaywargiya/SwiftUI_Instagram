//
//  User.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 11/05/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    //  let uid: String
    @DocumentID var id: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    var currentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats: Codable {
    var following: Int
    var followers: Int
    var posts: Int
}
