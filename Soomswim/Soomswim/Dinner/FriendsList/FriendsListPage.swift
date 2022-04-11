//
//  FriendsListPage.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI

struct FriednsListPage: View {
    var body: some View {
        VStack {
            ForEach(0..<8) {_ in
              FriendsList1()
              FriendsList2()
            }
        }
    }
}

struct FriendsListPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriednsListPage()
        }
    }
}
