//
//  DataType.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/08.
//

import Foundation

protocol DataType {
    init?(_ string: String)
}

extension Int: DataType {}
extension String: DataType {}
extension Bool: DataType {}
