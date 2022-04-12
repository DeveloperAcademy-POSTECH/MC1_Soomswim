//
//  Tab.swift
//  SoomshimUI
//
//  Created by creohwan on 2022/04/06.
//

import SwiftUI

struct HomeTab: View {
    @State private(set) var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        TabView {
            Feed(name: self.$name)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Feed")
                }

            MyPageView(name: self.$name)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("My Page")
                }
        }
        
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab(name: "Dinner")
    }
}
