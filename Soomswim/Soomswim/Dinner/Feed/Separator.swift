//
//  Separator.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Seperator: View {
    var body: some View {
        Rectangle()
            .frame(width: nil, height: 1, alignment: .center)
            .foregroundColor(Color(uiColor: .systemGray2))
            .padding(.leading, 13.04)
            .padding(.trailing, 13.04)

    }
}
