//
//  CommentsCell.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 22/05/21.
//

import SwiftUI

struct CommentsCell: View {
    var body: some View {
        HStack {
            Image("captain")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("Captain")
                .font(.system(size: 14, weight: .semibold)) +
            Text(" some test comment for now")
                .font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
}

struct CommentsCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell()
    }
}
