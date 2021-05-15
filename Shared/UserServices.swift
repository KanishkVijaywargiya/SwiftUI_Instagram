//
//  UserServices.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 14/05/21.
//

import Firebase

struct UserServices {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unFollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).delete { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            completion(isFollowed)
        }
    }
}
