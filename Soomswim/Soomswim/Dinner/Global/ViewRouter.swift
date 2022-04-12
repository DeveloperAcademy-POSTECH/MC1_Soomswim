//
//  ViewRouter.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/09.
//

import SwiftUI

protocol SoomswimView: View {
    static var page: Page { get }
}

enum Page {
    case login, feed, friends, mypage
}

class ViewRouter: ObservableObject {
    static let userKey: String = "name"
    
    @Published private(set) var currentPage: Page
    private(set) var name: String
    
    init() {
        if let name = UserDefaults.standard.object(forKey: Self.userKey) as? String {
            self.name = name
            self.currentPage = .feed
        } else {
            self.name = ""
            self.currentPage = .login
        }
    }
    
    func user(_ name: String) {
        self.name = name
    }
    
    func switchPage(_ page: Page) {
        DispatchQueue.main.async {
            self.currentPage = page
        }
    }
}
