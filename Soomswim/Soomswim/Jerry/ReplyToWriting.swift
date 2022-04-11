//
//  ReplyToWriting.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/06.
//

import SwiftUI

extension Color {
    static let messageGradient : [LinearGradient] = [
        LinearGradient(
        colors: [Color(red: 252/255, green: 37/255, blue: 151/255), Color(red: 250/255, green: 253/255, blue: 163/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 245/255, green: 116/255, blue: 285/255), Color(red: 89/255, green: 97/255, blue: 225/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 71/255, green: 139/255, blue: 214/255), Color(red: 37/255, green: 216/255, blue: 221/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 243/255, green: 199/255, blue: 83/255), Color(red: 18/255, green: 235/255, blue: 207/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 245/255, green: 177/255, blue: 97/255), Color(red: 236/255, green: 54/255, blue: 110/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 252/255, green: 225/255, blue: 208/255),
                 Color(red: 255/255, green: 173/255, blue: 214/255), Color(red: 162/255, green: 186/255, blue: 245/255)], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(
        colors: [Color(red: 255/255, green: 128/255, blue: 0/255),
                 Color(red: 232/255, green: 211/255, blue: 59/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
    ]
    static let backgroundGradient = LinearGradient(
        colors: [Color.mainPurple, Color.subPurple, .black],
        startPoint: .topLeading ,endPoint: .bottomTrailing)
}


struct ReplyToWritingView: View{
    var story: Story
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    @State var replys: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    var body: some View {
        ZStack{
            Color.backgroundGradient
            ScrollView{
                VStack(alignment: .leading, spacing: 40){
                    Text("\(story.date) \n답장이 도착했습니다.")
                        .font(Font.system(size: 25, weight: .semibold))
                        .lineSpacing(10)
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(replys.indices, id: \.self){index in
                            NavigationLink(destination: ReplyDetailView(tabSelection:index, story: story)){
                                    Color.messageGradient.randomElement()
                                        .frame(height: 70)
                                        .mask({
                                        Image(systemName: "envelope.fill")
                                            .resizable()
                                            .scaledToFit()})
                                }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
            .frame(width: 358, height: 526, alignment: .leading)
            .background(.white)
            .cornerRadius(20)
        }
    }
}
