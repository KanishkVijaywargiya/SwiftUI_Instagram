//
//  FeedCell.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 25/04/21.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false}
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var animate = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                if let user = viewModel.post.user {
                    NavigationLink(destination: ProfileView(user: user)) {
                        KFImage(URL(string: viewModel.post.ownerImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipped()
                            .cornerRadius(18)
                        
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            .padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            // action buttons
            HStack(spacing: 16) {
                Button(action: {
                    self.animate = true
                    didLike ? viewModel.unLike() : viewModel.like()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.animate = false
                    }
                }) {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                .scaleEffect(animate ? 1.4 : 1)
                
                NavigationLink(destination: CommentsView(post: viewModel.post)) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }
            .padding(.leading, 4)
            .foregroundColor(.primary)
            
            // caption
            if(viewModel.likesString.isEmpty) {
                EmptyView()
            } else {
                Text(viewModel.likesString)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 0.5)
            }
            
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) +
                    Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("\(viewModel.post.timestamp)")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}
