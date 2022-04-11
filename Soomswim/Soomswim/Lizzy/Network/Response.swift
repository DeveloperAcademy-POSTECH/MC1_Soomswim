//
//  Response.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/08.
//

import Foundation

struct Response<T: Codable>: Codable {    
    let code: Int
    let message: String
    let data: T?
}
