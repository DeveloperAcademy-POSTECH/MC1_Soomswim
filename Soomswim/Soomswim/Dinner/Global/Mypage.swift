//
//  Mypage.swift
//  SoomshimUI
//
//  Created by creohwan on 2022/04/06.
//

import SwiftUI

struct Mypage: View {
    var body: some View {
        VStack{
        Header()
            .frame(width: nil, height: nil, alignment: .top)
        List {
            Text("첫번째 게시글")
            Text("두번째 게시글")
            Text("첫번째 게시글")
            Text("두번째 게시글")
                
            }
        }
    }
}

struct Mypage_Previews: PreviewProvider {
    static var previews: some View {
        Mypage()
    }
}
