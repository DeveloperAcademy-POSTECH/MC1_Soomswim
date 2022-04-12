//
//  MyWritingCard.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/07.
//

import SwiftUI

struct MyWritingCardView: View{
    @Binding private var name: String
    private let story: Story2
    private var replyCheckPermission: Bool
    init(name: Binding<String>, story: Story2){
        self._name = name
        self.story = story
        self.replyCheckPermission = story.reply_check_permission ?? false
    }

    var body: some View{
        VStack(alignment:.leading){
            VStack(alignment: .leading, spacing: 35) {
                Text(self.story.date)
                    .font(Font.system(size: 14, weight: .bold))
                Text(self.story.content)
                    .font(Font.system(size: 12, weight: .medium))
                    .lineLimit(2)
            }
            .padding(10)
            Spacer()
            NavigationLink(destination: ReplyToWritingView(name: self.$name, id: self.story.id, date:story.date)) {
                HStack{
                    Text(replyCheckPermission ? "답장 보기" : "\(self.story.remaining_time ?? "")").font(Font.system(size: 11))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(10)
                .frame(height: 47)
            }
            .background(Color.mainPurple)
            .disabled(!replyCheckPermission)
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
