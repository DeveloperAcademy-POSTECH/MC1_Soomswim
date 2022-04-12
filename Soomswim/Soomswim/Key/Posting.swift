//
//  Posting.swift
//  Soomswim
//
//  Created by Admin on 2022/04/11.
//

import SwiftUI

struct PostingHeader: View {
    private let viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        HStack {
            Button(action: {
                self.viewRouter.switchPage(.feed)
            }) {
                Image(systemName: "chevron.backward")
                      .resizable()
                      .foregroundColor(Color.black)
                      .frame(width: 15, height: 20)
            }
                .padding()
            Spacer()
            Group {
                Text("S")
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color.mainPurple)
                    .font(.system(size: 25)) +
                Text("oom")
                    .italic()
                    .fontWeight(.black)
                    .font(.system(size: 21)) +
                Text("s")
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color.mainPurple)
                    .font(.system(size: 25)) +
                Text("wim")
                    .italic()
                    .fontWeight(.black)
                    .font(.system(size: 21))
            }
                .frame(width: 130, height: 30, alignment: .center)
                .padding()
        }
    }
}

struct PostingUser: View {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        HStack()
        {
            Profile().padding(.trailing, 13.79)
            Text(self.name)
                .font(Font.system(size: 15, weight: .semibold))
                .multilineTextAlignment(.leading)
                .lineSpacing(7)
                .padding(.vertical, 19.00)
            Spacer()
        }
        .padding(.horizontal, 38.0)
        .frame(width: nil, height: 80, alignment: .center)
    }
}

struct PostingFooter: View {
    var body: some View {
        HStack {
            Spacer()
            // 이모지 버튼
            Button(action: {
                print("clicked 감정표현")
            }) {
                Image(systemName: "face.smiling")
                      .resizable()
                      .foregroundColor(Color.orange)
                      .frame(width: 20, height: 20)
            }
            .padding(.all, 10)
            // 댓글쓰기 버튼
            Button(action: {
                print("clicked 댓글쓰기")
            }) {
                Image(systemName: "square.and.pencil")
                      .resizable()
                      .foregroundColor(Color.green)
                      .frame(width: 20, height: 20)
            }
            .padding(.all, 10)
            .padding(.trailing)
        }
    }
}

struct Posting: View {
    private let viewRouter: ViewRouter
    private let story: Story2
    @ObservedObject private var detailStory: DataLoader<Story2>
    
    init(viewRouter: ViewRouter, story: Story2) {
        self.viewRouter = viewRouter
        self.story = story
        self.detailStory = DataLoader<Story2>()
        self.contents()
    }
    
    var body: some View {
        VStack {
            PostingHeader(viewRouter: self.viewRouter)
                .frame(width: nil, height: nil, alignment: .top)
            if let detailStory = self.detailStory.data {
                ScrollView{
                    PostingUser(name: detailStory.writer.name)
                    Seperator()
                    Text("\(detailStory.content)")
                        .padding(.all, 20)
                        .lineSpacing(10)
                }
            }
            
            PostingFooter()
                .frame(width: nil, height: nil, alignment: .bottom)
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
