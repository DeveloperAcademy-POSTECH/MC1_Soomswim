//
//  Story.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/10.
//

import Foundation

struct Story2: Codable {
    let id: Int
    let date: String
    let content: String
    let writer: User
}
