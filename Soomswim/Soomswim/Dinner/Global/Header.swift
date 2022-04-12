//
//  Header.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct Header: View {
    @Binding private var name: String
    private let viewRouter: ViewRouter
    
    init(name: Binding<String>, viewRouter: ViewRouter) {
        self._name = name
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        HStack {
            LinearGradient(gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]),
                           startPoint: .leading,
                           endPoint: .trailing)
            .mask(self.logo)
            .frame(width: 130, height: 30, alignment: .center)
            .padding(.leading, 20)
            Spacer()
            
            Button(action: {
                self.viewRouter.switchPage(.post)
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(Color(uiColor: UIColor.systemGray))
            })
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

struct HeaderView_Previews: PreviewProvider {
    @State static var name: String = "Lizy"
    static var previews: some View {
        Group {
            Header(name: Self.$name, viewRouter: ViewRouter())
        }
    }
}
