//
//  CommentsView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 22/05/21.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0..<10) { _ in
                        CommentsCell()
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
