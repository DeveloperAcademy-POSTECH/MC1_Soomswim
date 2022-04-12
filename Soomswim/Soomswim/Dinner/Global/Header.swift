
//  Header.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Header: View {
    @Binding private var name: String
    
    init(name: Binding<String>) {
        self._name = name
    }
    
    var body: some View {
        HStack {
            LogoEnglish()
            Spacer()
            NavigationLink(destination: PostInputView(name: self.name)) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(Color(uiColor: UIColor.systemGray))
            }
            .padding(.trailing, 20)
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
