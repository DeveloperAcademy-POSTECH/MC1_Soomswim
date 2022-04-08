//
//  StoryPreview.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI



struct StoryPreview1: View {
    var body: some View {
        HStack {

            Profile().padding(.trailing, 29.07)
            StoryContentPreview()
        }
        .frame(width: nil, height: 117, alignment: .leading)
        
               

    }
}


struct StoryPreview2: View {
    var body: some View {
        HStack {
            StoryContentPreview()
            Profile().padding(.leading, 29.07)
        }
        .frame(width: nil, height: 117, alignment: .leading)
    }
}

struct StoryPreview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryPreview1()
            StoryPreview2()
        }
    }
}

