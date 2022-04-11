//
//  ReplyDetail.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/10.
//

import Foundation

import SwiftUI

struct ReplyDetailView: View{
    @State var tabSelection : Int
    @State var replys: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    var story : Story

    var body: some View {
        ZStack{
            Color.backgroundGradient
            VStack(alignment: .leading){
                Text("\(story.date) \n답장이 도착했습니다.")
                    .font(Font.system(size: 25, weight: .semibold))
                    .lineSpacing(10)
                    .foregroundColor(.white)
                
                
                TabView(selection: $tabSelection){
                    ForEach(replys.indices, id:\.self){index in
                        ReplyContents()
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
                .frame(width: 358, height: 526, alignment: .leading)
                .background(.white)
                .cornerRadius(20)

            }
            
        }
    }
}

struct ReplyContents: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("From. 너의 친구")
                .font(Font.system(size: 21, weight: .bold))
            ScrollView{
            Text("항상 너를 응원하고 있는 누군가가 있다는 걸 알아주길 바래! 🥰 항상 너를 응원하고 있는 누군가가 있다는 걸 알아주길 바래! 🥰")
                .font(Font.system(size: 15))
                .lineSpacing(10)
            }
            Spacer()
        }
    }
}
