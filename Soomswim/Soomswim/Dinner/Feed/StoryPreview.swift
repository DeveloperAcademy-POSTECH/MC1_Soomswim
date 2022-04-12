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
