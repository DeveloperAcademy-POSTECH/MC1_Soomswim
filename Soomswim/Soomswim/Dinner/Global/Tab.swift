//
//  Tab.swift
//  SoomshimUI
//
//  Created by creohwan on 2022/04/06.
//

import SwiftUI

struct HomeTab: View {
    @State private(set) var name: String
    private let viewRouter: ViewRouter
    
    init(name: String, viewRouter: ViewRouter) {
        self.name = name
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        TabView {
            Feed(name: self.$name, viewRouter: viewRouter)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Feed")
                }

            MyPageView(name: self.$name, viewRouter: self.viewRouter)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("My Page")
                }
        }
        
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab(name: "Dinner", viewRouter: ViewRouter())
    }
}
