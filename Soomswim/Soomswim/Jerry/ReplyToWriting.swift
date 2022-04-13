//
//  ReplyToWriting.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/06.
//

import SwiftUI

struct ReplyToWritingView: View{
    @Binding private var name: String
    @ObservedObject private var replies: DataLoader<RepliesInfo>
    private let id: Int
    private let date: String

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    init(name: Binding<String>, id: Int, date: String){
        self._name = name
        self.id = id
        self.date = date
        self.replies = DataLoader<RepliesInfo>()
        self.contents()
    }
    
    var body: some View {
        ZStack{
            Color.backgroundGradient
                .edgesIgnoringSafeArea([.bottom])
            ScrollView{
                VStack(alignment: .leading, spacing: 40){
                    Text("\(self.date) \n답장이 도착했습니다.")
                        .font(Font.system(size: 25, weight: .semibold))
                        .lineSpacing(10)
                    if let replies = self.replies.data,
                       replies.count > 0{
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(Array(zip(Array(0..<replies.count), replies.id_list)), id:\.0){(idx, reply) in
                                NavigationLink(destination: ReplyDetailView(tabSelection:idx, replies: replies.id_list, name: self.$name, date: date)){
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
                    else {Text("")}
                }
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
            .frame(width: 358, height: 526, alignment: .leading)
            .background(.white)
            .cornerRadius(20)
        }
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.replies).request(params: ["name": self.name, "story": id]) else { return print("error") }
        NetworkService().request(request, handler: fillReplies)
    }

    private func fillReplies(data: Response<RepliesInfo>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let replies = data.data
        else { return print("no contents") }
        self.replies.fill(data: replies)
    }
}
