//
//  Header.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            LinearGradient(gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]),
                           startPoint: .leading,
                           endPoint: .trailing)
            .mask(self.logo)
            .frame(width: 130, height: 30, alignment: .center)
            .padding(.leading, 20)
            Spacer()

        }
        .frame(width: nil, height: 67, alignment: .center)
    }
    
    private var logo: some View {
        Text("Soomswim")
            .italic()
            .fontWeight(.black)
            .lineSpacing(25)
            .font(.system(size: 21))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Header()
        }
    }
}
