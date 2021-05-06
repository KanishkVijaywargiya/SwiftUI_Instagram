//
//  UserCell.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 27/04/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // Image
            Image("captain")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            //VStack -> username, fullname
            VStack(alignment: .leading) {
                Text("@captain")
                    .font(.system(size: 14, weight: .semibold))
                Text("Steve Rodgers")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
