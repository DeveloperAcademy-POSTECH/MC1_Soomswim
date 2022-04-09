//
//  DataLoader.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/10.
//

import Foundation

class DataLoader<T>: ObservableObject {
    @Published private(set) var data: T? = nil
    
    func fill(data: T) {
        DispatchQueue.main.async {
            self.data = data
        }
    }
}
