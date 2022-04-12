//
//  Reply.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/11.
//

import Foundation

struct Reply: Codable {
    let id: Int
    let date: String
    let content: String
    let writer: String
}
