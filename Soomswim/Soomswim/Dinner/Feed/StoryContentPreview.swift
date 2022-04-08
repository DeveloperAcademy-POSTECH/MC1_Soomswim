//
//  StoryContentPreview.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct StoryContentPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text("User Name")
                .font(Font.system(size: 15, weight: .semibold))
                .lineSpacing(7)
                .padding(.bottom, 8.72)
            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(Font.system(size: 12, weight: .regular))
                .lineLimit(3)
                .lineSpacing(8)
                .frame(width: 261.67, height: 60, alignment: .leading)
        }
    }
}

struct StoryContentPreview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryContentPreview()
        }
    }
}

