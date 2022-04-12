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
    case login, feed, friends, mypage, posting
}

class ViewRouter: ObservableObject {
    static let userKey: String = "name"
    
    @Published private(set) var currentPage: Page
    private(set) var name: String
    private(set) var storyId: Int
    
    init() {
        if let name = UserDefaults.standard.object(forKey: Self.userKey) as? String {
            self.name = name
            self.currentPage = .feed
        } else {
            self.name = ""
            self.currentPage = .login
        }
        self.storyId = 1
    }
    
    func user(_ name: String) {
        self.name = name
    }
    
    func story(_ id: Int) {
        self.storyId = id
    }
    
    func switchPage(_ page: Page) {
        DispatchQueue.main.async {
            self.currentPage = page
        }
    }
}
