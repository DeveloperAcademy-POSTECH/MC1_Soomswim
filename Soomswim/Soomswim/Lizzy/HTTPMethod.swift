//
//  HTTPMethod.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/08.
//

import Foundation

protocol HTTPMethod {
    var method: String { get }
    
    func request(params: [String: DataType]?) -> URLRequest?
}

struct Get: HTTPMethod {
    let method: String = "get"
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func request(params: [String : DataType]?) -> URLRequest? {
        guard var components = URLComponents(string: self.url) else { return nil }
        if let params = params {
            components.queryItems = params.map() {
                URLQueryItem(name: $0, value: "\($1)")
            }
        }
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        return request
    }
}

struct Post: HTTPMethod {
    let method: String = "post"
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func request(params: [String : DataType]?) -> URLRequest? {
        guard let url = URL(string: self.url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let params = params,
           let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) {
            request.httpBody = data
        }
        return request
    }
}
