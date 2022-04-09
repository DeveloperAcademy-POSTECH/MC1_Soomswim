//
//  StoryPreview.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct StoryPreview1: View {
    private let story: Story2
    
    init(story: Story2) {
        self.story = story
    }
    
    var body: some View {
        HStack {
            Profile().padding(.trailing, 29.07)
            StoryContentPreview(writer: self.story.writer.name, content: self.story.content)
        }
        .frame(width: nil, height: 117, alignment: .leading)
    }
}


struct StoryPreview2: View {
    private let story: Story2
    
    init(story: Story2) {
        self.story = story
    }
    
    var body: some View {
        HStack {
            StoryContentPreview(writer: self.story.writer.name, content: self.story.content)
            Profile().padding(.leading, 29.07)
        }
        .frame(width: nil, height: 117, alignment: .leading)
    }
}

struct StoryPreview_Previews: PreviewProvider {
    static private let story = Story2(id: 1,
                                      date: "2000.11.11",
                                      content: "옥 별이 언덕 있습니다. 밤이 다하지 이국 하나의 벌레는 이 차 내린 까닭입니다. 마디씩 가을로 별을 버리었습니다. 잔디가 경, 릴케 아직 소학교 새워 애기 위에도 벌레는 까닭입니다. 소녀들의 말 프랑시스 벌레는 내일 헤는 별에도 가득 아직 있습니다. 청춘이 언덕 흙으",
                                      writer: User(id: 1,
                                                   name: "tmfrlrkvlek",
                                                   profile: ""))
                                      
    static var previews: some View {
        Group {
            StoryPreview1(story: self.story)
            StoryPreview2(story: self.story)
        }
    }
}

