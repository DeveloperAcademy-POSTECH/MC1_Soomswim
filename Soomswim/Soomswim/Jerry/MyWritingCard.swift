//
//  MyWritingCard.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/07.
//

import SwiftUI


struct MyWritingCardView: View{
    var story: Story
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius: 2, x: 0, y: 5)
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
            VStack(alignment: .leading, spacing: 20) {
                Text(story.date)
                    .font(Font.system(size: 14, weight: .bold))
                Text(story.content)
                    .font(Font.system(size: 12, weight: .medium))
                    .lineLimit(2)
                NavigationLink {
                    ReplyToWritingView(color: .blue)
                } label: {
                    Text(story.replyCheckPermission ? "답변 보기" : "답변 보기까지 \(story.remainingTime ?? "")").font(Font.system(size: 11))
                }
                .disabled(!story.replyCheckPermission)
            }
            .padding(10)
        }
        .frame(width: 150, height: 150)
    }
}
