//
//  ProfileHeaderView.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 29/04/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("captain")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Following")
                    UserStatView(value: 4, title: "Following")
                }.padding(.trailing, 32)
                
            }
            
            Text("Steve Rodgers")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading,.top])
            
            Text("Captain America || The First Avenger")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView()
                
                Spacer()
            }.padding(.top)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
