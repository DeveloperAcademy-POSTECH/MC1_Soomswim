//
//  Profile.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill") // 이미지 추가 필요
                .foregroundColor(Color(uiColor: UIColor.systemGray))
                .frame(width: 65.24, height: 65.24, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle()
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing), lineWidth: 2.34))
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Profile()
        }
    }
}

