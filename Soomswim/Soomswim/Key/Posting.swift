//
//  Posting.swift
//  Soomswim
//
//  Created by Admin on 2022/04/11.
//

import SwiftUI

struct Posting: View {
    private let story: Story2
    @ObservedObject private var detailStory: DataLoader<Story2>
    
    init(story: Story2) {
        self.story = story
        self.detailStory = DataLoader<Story2>()
        self.contents()
    }
    
    var body: some View {
        VStack {
            if let detailStory = self.detailStory.data {
                ScrollView{
                    PostingUser(name: detailStory.writer.name)
                    Seperator()
                    Text("\(detailStory.content)")
                        .padding(.all, 20)
                        .lineSpacing(10)
                }
            }
            // 수정필요: 이름 받아와야 함
            PostingFooter(name: "Eddy")
                .frame(width: nil, height: nil, alignment: .bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: BackButton())
        .navigationBarBackButtonHidden(true)
        .toolbar {
            LogoEnglish()
        }
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.story).request(params: ["name": self.story.writer.name, "story": self.story.id]) else { return print("error") }
        NetworkService().request(request, handler: fillContents)
    }
    
    private func fillContents(data: Response<Story2>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let story = data.data
        else { return print("no contents") }

        self.detailStory.fill(data: story)
    }
}
