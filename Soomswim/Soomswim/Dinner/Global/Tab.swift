//
//  Tab.swift
//  SoomshimUI
//
//  Created by creohwan on 2022/04/06.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("feed")
                }

            Mypage()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("My Page")
                }
        }
        
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
