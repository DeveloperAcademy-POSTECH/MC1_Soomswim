//
//  FriendsName.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI



struct FriendsName: View {
    var body: some View {
      Text("Dinner")
          .font(Font.system(size: 15, weight: .semibold))
          .multilineTextAlignment(.leading)
          .lineSpacing(7)
          .padding(.vertical, 19.00)
    }
}



struct FriendsName_Previews: PreviewProvider {
    static var previews: some View {
        Group {
              FriendsName()
        }
    }
}
