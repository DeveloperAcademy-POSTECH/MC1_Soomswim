//
//  Feed.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Feed: View {
    private let viewRouter: ViewRouter
    @Binding private var name: String
    @ObservedObject private var stories: DataLoader<Array<Story2>>
    
    init(viewRouter: ViewRouter, name: Binding<String>) {
        self._name = name
        self.stories = DataLoader<Array<Story2>>()
        self.viewRouter = viewRouter
        self.contents()
    }
    
    var body: some View {
        VStack {
            Header()
            ScrollView {
                if let stories = self.stories.data,
                   stories.count > 0 {
                    ForEach(Array(zip(Array(0..<stories.count), stories)), id: \.0, content: { (idx, story) in
                        if idx != 0 { Seperator() }
                        Button(action: {
                            self.viewRouter.story(story)
                            self.viewRouter.switchPage(.posting)
                        }) {
                            switch idx % 2 == 0 {
                            case true : StoryPreview1(story: story)
                            case false : StoryPreview2(story: story)
                            }
                        }
                        .foregroundColor(Color.black)
                    })
                }
                else { Text("No Contents") }
            }
        }
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.stories).request(params: ["name": self.name]) else { return print("error") }
        NetworkService().request(request, handler: fillFeed)
    }
    
    private func fillFeed(data: Response<Array<Story2>>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let stories = data.data
        else { return print("no contents") }
        self.stories.fill(data: stories)
    }
}

struct Feed_Previews: PreviewProvider {
    @State static private var name: String = "Dinner"
    
    static var previews: some View {
        Group {
            Feed(viewRouter: ViewRouter(), name: self.$name)
        }
    }
}
