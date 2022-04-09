//
//  ViewRouter.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/09.
//

import Foundation
import SwiftUI
import Combine

protocol SoomswimView: View {
    static var page: Page { get }
}

enum Page {
    case login, feed
}

class ViewRouter: ObservableObject {
    @Published private(set) var currentPage: Page
    private(set) var name: String? = nil
    
    init() {
        if let name = UserDefaults.standard.object(forKey: "name") as? String {
            self.name = name
            self.currentPage = .feed
        } else {
            self.currentPage = .login
        }
    }
    
    func switchPage(_ page: Page) {
        DispatchQueue.main.async {
            self.currentPage = page
        }
    }
}
