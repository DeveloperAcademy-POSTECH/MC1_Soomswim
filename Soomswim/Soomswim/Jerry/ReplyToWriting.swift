//
//  ReplyToWriting.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/06.
//

import SwiftUI

struct ReplyToWriting: View{
    var color: Color
    
    var body: some View {
        color
            .frame(width: 200, height: 100)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Logo()
                }
            }
    }
}
