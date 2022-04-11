//
//  FriendsList.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//
import SwiftUI

struct FriendsList1: View {
    var body: some View {
      HStack()
      {
        FriendsProfile().padding(.trailing, 13.79)
        FriendsName()
        Spacer()
        Button("삭제") {
          
        }
        .accentColor(Color.FriendsListBlue)
      }
      .padding(.horizontal, 38.0)
      .frame(width: nil, height: 80, alignment: .center)

    }
}

struct FriendsList2: View {
    var body: some View {
      HStack()
      {
        FriendsProfile().padding(.trailing, 13.79)
        FriendsName()
        Spacer()
        Button("삭제") {
          
        }
        .accentColor(Color.FriendsListBlue)
      }
      .padding(.horizontal, 38.0)
      .frame(width: nil, height: 80, alignment: .center)
      .background(Color.FriendsListGrey)

    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
              FriendsList1()
              FriendsList2()
        }
    }
}
