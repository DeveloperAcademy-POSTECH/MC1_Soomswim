//
//  Posting-key.swift
//  Soomswim
//
//  Created by Park KeeWoong on 2022/04/11.
//

import SwiftUI

struct PostHeader: View {
    var body: some View {
        HStack {
            Spacer()
            LinearGradient(gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]),
                           startPoint: .leading,
                           endPoint: .trailing)
            .mask(self.logo)
            .frame(width: 130, height: 30, alignment: .center)
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

struct Posting_key: View {
    var body: some View {
        VStack{
            PostHeader()
                .frame(width: nil, height: nil, alignment: .top)
            ScrollView {
                VStack {
                    Image("sample")
                        .resizable()
                        .frame(width: nil, height: 400)
                        .padding(.all, 20)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
                        .font(.system(.body, design:
                                .rounded))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20)
                }
            }
        }
    }
}

struct Posting_key_Previews: PreviewProvider {
    static var previews: some View {
        Posting_key()
    }
}
