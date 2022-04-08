//
//  Logo.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/06.
//

import SwiftUI

struct Logo: View{
    var body: some View{
        Text("Soomswim")
            .italic()
            .fontWeight(.black)
            .lineSpacing(25)
            .font(.system(size: 21))
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
    }
}
