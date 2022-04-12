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
  
    static let messageGradient : [LinearGradient] = [
        LinearGradient(
        colors: [Color(red: 252/255, green: 37/255, blue: 151/255), Color(red: 250/255, green: 253/255, blue: 163/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 245/255, green: 116/255, blue: 285/255), Color(red: 89/255, green: 97/255, blue: 225/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 71/255, green: 139/255, blue: 214/255), Color(red: 37/255, green: 216/255, blue: 221/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 243/255, green: 199/255, blue: 83/255), Color(red: 18/255, green: 235/255, blue: 207/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 245/255, green: 177/255, blue: 97/255), Color(red: 236/255, green: 54/255, blue: 110/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 252/255, green: 225/255, blue: 208/255),
                 Color(red: 255/255, green: 173/255, blue: 214/255), Color(red: 162/255, green: 186/255, blue: 245/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 255/255, green: 128/255, blue: 0/255),
                 Color(red: 232/255, green: 211/255, blue: 59/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
    ]
    static let backgroundGradient = LinearGradient(
        colors: [Color.mainPurple, Color.subPurple, .black],
        startPoint: .topLeading ,endPoint: .bottomTrailing)
}
