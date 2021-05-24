//
//  ProfileViewModel.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 14/05/21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserServices.follow(uid: uid) { _ in
            NotificationsViewModel.uploadNotifications(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
    }
    
    func unFollow() {
        guard let uid = user.id else { return }
        UserServices.unFollow(uid: uid) { _user in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.currentUser else { return }
        guard let uid = user.id else { return }
        UserServices.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}

