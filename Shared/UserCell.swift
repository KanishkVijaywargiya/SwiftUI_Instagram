//
//  UserCell.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 27/04/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            // Image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            //VStack -> username, fullname
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}
