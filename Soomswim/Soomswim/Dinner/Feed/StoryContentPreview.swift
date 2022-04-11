//
//  StoryContentPreview.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct StoryContentPreview: View {
    private let writer: String
    private let content: String
    
    init(writer: String, content: String) {
        self.writer = writer
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text(self.writer)
                .font(Font.system(size: 15, weight: .semibold))
                .lineSpacing(7)
                .padding(.bottom, 8.72)
            Text(self.content)
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
            StoryContentPreview(writer: "Lizzy", content: "옥 별이 언덕 있습니다. 밤이 다하지 이국 하나의 벌레는 이 차 내린 까닭입니다. 마디씩 가을로 별을 버리었습니다. 잔디가 경, 릴케 아직 소학교 새워 애기 위에도 벌레는 까닭입니다. 소녀들의 말 프랑시스 벌레는 내일 헤는 별에도 가득 아직 있습니다. 청춘이 언덕 흙으")
        }
    }
}

