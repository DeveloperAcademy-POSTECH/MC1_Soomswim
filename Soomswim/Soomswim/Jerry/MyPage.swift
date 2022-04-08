//
//  MyPage.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/07.
//

import SwiftUI

struct MyPageView: View {
    var storys : [Story] = loadJson()
    
    let columns = [
        GridItem(.fixed(150), spacing: 50),
        GridItem(.fixed(150))
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(storys) {story in
                        NavigationLink(destination: MyWritingView(story: story)){
                                MyWritingCardView(story: story)
                            }
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
