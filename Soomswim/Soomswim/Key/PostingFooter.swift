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
                        
                }
                .padding(.all, 10)
                .padding(.trailing)
            }
        }
    }
}
