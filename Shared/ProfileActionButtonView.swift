//
//  ProfileActionButtonView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 29/04/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false}
    
    var body: some View {
        if viewModel.user.currentUser {
            // edit profile button
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1.0)
                    )
            }
        } else {
            // follow and message button
            HStack {
                
                Button(action: {
                    isFollowed ? viewModel.unFollow() : viewModel.follow()
                }) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .background(isFollowed ? Color.white : Color.blue)
                        .foregroundColor(isFollowed ? .black : .white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1.0 : 0)
                        )
                }.cornerRadius(3.0)
                
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                }
            }
        }
    }
}
