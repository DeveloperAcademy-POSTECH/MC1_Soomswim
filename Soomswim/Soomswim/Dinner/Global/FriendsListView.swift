//
//  FriendsListView.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI

struct FriendsListView: View {
    @Binding private var name: String
    private let viewRouter: ViewRouter
    
    init(name: Binding<String>, viewRouter: ViewRouter) {
        self._name = name
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        VStack {
            Header(name: self.$name, viewRouter: self.viewRouter)
                .frame(width: nil, height: nil, alignment: .top)
            
            ScrollView() {
              FriednsListPage()
            }
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    @State static var name: String = "Lizzy"
    static var previews: some View {
        Group {
            FriendsListView(name: self.$name, viewRouter: ViewRouter())
        }
    }
}
