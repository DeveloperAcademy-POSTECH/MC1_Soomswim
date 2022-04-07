//
//  Feed.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        VStack {
            ForEach(0..<5) {_ in
                StoryPreview1()
                Seperator()
                StoryPreview2()
                Seperator()
            }
            StoryPreview1()
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Feed()
        }
    }
}
