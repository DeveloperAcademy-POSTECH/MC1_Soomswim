//
//  PostingFooter.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/12.
//

import SwiftUI

struct PostingFooter: View {
    @Binding var popUp: Bool
    
    var body: some View {
        ZStack{
            HStack {
                Spacer()
                // 댓글쓰기 버튼
                Button(action: {
                    self.popUp = true
                }) {
                    Text("답장 쓰기")
                        .foregroundColor(Color.blue)
//                    Image(systemName: "envelope")
//                          .resizable()
//                          .foregroundColor(Color.green)
//                          .scaledToFit()
//                          .frame(width: 20, height: 20)
                }
                .padding(.all, 10)
                .padding(.trailing)
            }
        }
    }
}
