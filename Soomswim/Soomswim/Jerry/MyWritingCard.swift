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
        VStack(alignment:.leading){
            VStack(alignment: .leading, spacing: 35) {
                Text(story.date)
                    .font(Font.system(size: 14, weight: .bold))
                Text(story.content)
                    .font(Font.system(size: 12, weight: .medium))
                    .lineLimit(2)
            }
            .padding(10)
            Spacer()
            NavigationLink(destination: ReplyToWritingView(story:story)) {
                HStack{
                    Text(story.replyCheckPermission ? "답변 보기" : "답변 보기까지 \(story.remainingTime ?? "")").font(Font.system(size: 11))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(10)
                .frame(height: 47)
            }
            .background(Color.mainPurple)
            .disabled(!story.replyCheckPermission)
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
        )
        .frame(width: 171, height: 179)
    }
}
