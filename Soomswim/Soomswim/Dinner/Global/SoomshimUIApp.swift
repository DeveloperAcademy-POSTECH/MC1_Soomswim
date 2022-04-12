//
//  SoomshimUIApp.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

@main
struct SoomshimUIApp: App {
    @ObservedObject private var viewRouter: ViewRouter
    
    init() {
        self.viewRouter = ViewRouter()
    }
    
    var body: some Scene {
        WindowGroup {
            switch self.viewRouter.currentPage {
            case .feed:
                HomeTab(name: self.viewRouter.name, viewRouter: self.viewRouter, index: 0)
            case .mypage :
                HomeTab(name: self.viewRouter.name, viewRouter: self.viewRouter, index: 1)
            case .login : Login(viewRouter: self.viewRouter)
            case .friends : FriendsListPage(name: self.viewRouter.name, viewRouter: self.viewRouter)
            }
        }
    }
}

