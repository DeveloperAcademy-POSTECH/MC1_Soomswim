//
//  MyWriting.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/06.
//

import SwiftUI

struct MyWritingView: View {
    @Binding private var name: String
    @ObservedObject private var mystory: DataLoader<Story2>
    private let id: Int
    private var replyCheckPermission: Bool = false
    
    init(name: Binding<String>, id: Int){
        self._name = name
        self.id = id
        self.mystory = DataLoader<Story2>()
        self.contents()
    }
    
    var body: some View {
        if let mystory = self.mystory.data{
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 15) {
                    Text(mystory.date)
                        .font(Font.system(size: 24, weight: .semibold))
                    Text(mystory.content)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 15, weight: .regular))
                        .lineSpacing(5)
                }
                .padding(EdgeInsets(top: 20, leading: 26, bottom: 0, trailing: 26))
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(mystory.reply_check_permission! ? "답장 보기" : "\(mystory.remaining_time ?? "")", destination: ReplyToWritingView(name: self.$name, id: mystory.id, date:mystory.date))
                        .disabled(!mystory.reply_check_permission!)
                }
            }
        }
        else {Text("")}
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.story).request(params: ["story": self.id, "name": self.name]) else { return print("error") }
        NetworkService().request(request, handler: fillMyStoryDetail)
    }

    private func fillMyStoryDetail(data: Response<Story2>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let mystory = data.data
        else { return print("no contents") }
        self.mystory.fill(data: mystory)
    }
}
