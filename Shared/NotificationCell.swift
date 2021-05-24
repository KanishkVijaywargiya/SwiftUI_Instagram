//
//  NotificationCell.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 27/04/21.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false}
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold)) +
                        Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 15))
                }
            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unFollow() : viewModel.follow()
                }) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .background(isFollowed ? Color.white : Color.blue)
                        .foregroundColor(isFollowed ? .black : .white)
                        .cornerRadius(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1.0 : 0)
                        )
                }
            }
            
        }.padding(.horizontal)
    }
}


