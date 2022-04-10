//
//  RequestFactory.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/08.
//

import Foundation

struct RequestFactory {
    private let url: SoomswimURL
    
    enum RequestError: Error {
        case requestError
    }
    
    init(url: SoomswimURL) {
        self.url = url
    }
    
    func request(params: [String: DataType]?) throws -> URLRequest  {
        guard let request = self.url.HTTPmethod().request(params: params) else { throw RequestError.requestError }
        return request
    }
}
