//
//  CommentsView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 22/05/21.
//

import SwiftUI

struct CommentsView: View {
    
    @ObservedObject var viewModel: CommentsViewModel
    @State var commentText = ""
    
    var comment: [Comment] {
        return viewModel.comments
    }
    
    init(post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(comment) { comment in
                        CommentsCell(comment: comment)
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        if(!commentText.isEmpty) {
            viewModel.uploadComment(commentText: commentText)
            commentText = ""
            UIApplication.shared.endEditing()
        } else {
            UIApplication.shared.endEditing()
        }
    }
}
