//
//  FeedView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 25/04/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var post: [Post] {
        return viewModel.posts
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 32) {
                ForEach(post) { post in
                    FeedCell(post: post)
                }
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
