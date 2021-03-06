//
//  NetworkService.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/05.
//

import Foundation

struct NetworkService {
    func request<T: Codable>(_ request: URLRequest, handler: @escaping (Response<T>, URLResponse?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { print(error ?? ""); return }
            if let data = data,
               let decodedData = try? JSONDecoder().decode(Response<T>.self, from: data) {
                handler(decodedData, response)
            }
        }
        task.resume()
    }
}

