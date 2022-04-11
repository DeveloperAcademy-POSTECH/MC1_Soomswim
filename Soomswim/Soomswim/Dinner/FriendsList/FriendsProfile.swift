//
//  FriendsProfile.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI

struct FriendsProfile: View {
    var body: some View {
        VStack {
            Image("") // 이미지 추가 필요
                .foregroundColor(Color(uiColor: UIColor.systemGray))
                .frame(width: 55.21, height: 55.21, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle()
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing), lineWidth: 2.34))
        }
    }
}

struct FriendsProfile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendsProfile()
        }
    }
}

