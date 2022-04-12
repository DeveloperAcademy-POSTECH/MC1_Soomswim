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
    @State private var index: Int
    
    init(name: String, viewRouter: ViewRouter, index: Int) {
        self.name = name
        self.viewRouter = viewRouter
        self.index = index
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: self.$index) {
                Feed(viewRouter: self.viewRouter,
                     name: self.$name)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Feed")
                    }
                    .tag(0)

                MyPageView(name: self.$name, viewRouter: self.viewRouter)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("My Page")
                    }
                    .tag(1)
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab(name: "Dinner", viewRouter: ViewRouter(), index: 0)
    }
}
