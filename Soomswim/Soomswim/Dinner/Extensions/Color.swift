//
//  Color.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

extension Color {
    static let mainGreen: Color = Color(red: 163/255, green: 246/255, blue: 168/255)
    static let mainMidOrange: Color = Color(red: 241/255, green: 203/255, blue: 134/255)
    static let mainOrange: Color = Color(red: 255/255, green: 87/255, blue: 0)
    static let FriendsListBlue: Color = Color(red: 39/255, green: 0, blue: 255/255)
    static let FriendsListGrey: Color = Color(red: 247/255, green: 247/255, blue: 247/255)
    static let subPurple: Color = Color(red: 120/255, green: 59/255, blue: 139/255)
    static let mainPurple: Color = Color(red: 228/255, green: 198/255, blue: 255/255)
    static let lightGray: Color = Color(red: 240/255, green: 240/255, blue: 245/255)
    static let pointPurple: Color = Color(red: 205/255, green: 72/255, blue: 221/255)
    static let logoGradient: LinearGradient = LinearGradient(
        colors: [Color.mainPurple, Color.pointPurple],
        startPoint: .top,
        endPoint: .bottom
    )
}
