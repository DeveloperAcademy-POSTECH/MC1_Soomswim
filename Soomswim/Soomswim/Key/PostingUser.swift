//
//  PostingUser.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/12.
//

import SwiftUI

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
