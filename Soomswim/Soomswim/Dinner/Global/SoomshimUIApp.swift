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
            case .home :
                HomeTab(name: self.viewRouter.name)
            case .login : Login(viewRouter: self.viewRouter)
            }
        }
    }
}

// 1. ViewRouter 에 페이지 추가
// 2. 해당 
