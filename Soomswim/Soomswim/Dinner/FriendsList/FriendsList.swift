//
//  FriendsList.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//
import SwiftUI

struct FriendsList: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
      HStack()
      {
          Profile().padding(.trailing, 13.79)
          Text(self.user.name)
              .font(Font.system(size: 15, weight: .semibold))
              .multilineTextAlignment(.leading)
              .lineSpacing(7)
              .padding(.vertical, 19.00)
          Spacer()
          Button(action: {
              
          }) {
              Text("삭제")
                  .font(Font.system(size: 15, weight: .semibold))
                  .foregroundColor(Color.mainOrange)
          }
          .accentColor(Color.FriendsListBlue)
      }
      .padding(.horizontal, 38.0)
      .frame(width: nil, height: 80, alignment: .center)
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendsList(user: User(id: 1, name: "Lizzy", profile: "1"))
        }
    }
}
