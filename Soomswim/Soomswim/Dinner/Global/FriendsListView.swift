//
//  FriendsListView.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI

struct FriendsListView: View {
    var body: some View {
        VStack {
            Header()
                .frame(width: nil, height: nil, alignment: .top)
            
            ScrollView() {
              FriednsListPage()
            }
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendsListView()
        }
    }
}
