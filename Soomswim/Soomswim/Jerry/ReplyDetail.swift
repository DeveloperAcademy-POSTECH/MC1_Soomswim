//
//  ReplyDetail.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/10.
//

import Foundation

import SwiftUI

struct ReplyDetailView: View{
    @State private var tabSelection : Int
    @State private var replies: [Int]
    @Binding private var name: String
    private let date: String
    
    init(tabSelection: Int, replies: [Int], name: Binding<String>, date: String){
        self._name = name
        self.tabSelection = tabSelection
        self.date = date
        self.replies = replies
    }

    var body: some View {
        ZStack{
            Color.backgroundGradient
                .edgesIgnoringSafeArea([.bottom])
            VStack(alignment: .leading){
                Text("\(date) \n답장이 도착했습니다.")
                    .font(Font.system(size: 25, weight: .semibold))
                    .lineSpacing(10)
                    .foregroundColor(.white)
                
                
                TabView(selection: $tabSelection){
                    ForEach(replies.indices, id:\.self){index in
                        ReplyContents(replyId: self.replies[index])
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
    @ObservedObject private var reply: DataLoader<Reply>
    private var replyId : Int

    init(replyId: Int){
        self.replyId = replyId
        self.reply = DataLoader<Reply>()
        contents()
    }

    var body: some View {
        if let reply = reply.data{
            VStack(alignment: .leading, spacing: 20){
                Text("From. \(reply.writer)")
                    .font(Font.system(size: 21, weight: .bold))
                ScrollView{
                    Text("\(reply.content)")
                    .font(Font.system(size: 15))
                    .lineSpacing(10)
                }
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
        } else{
            Text("")
        }
    }

    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.repliesreply).request(params: ["reply": self.replyId]) else { return print("error") }
        NetworkService().request(request, handler: fillReplyDetail)
    }

    private func fillReplyDetail(data: Response<Reply>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let reply = data.data
        else { return print("no contents") }
        self.reply.fill(data: reply)
    }
}
