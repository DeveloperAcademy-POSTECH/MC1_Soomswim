//
//  User.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/10.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let profile: String
}

