//
//  LaunchScreen.swift
//  Soomswim
//
//  Created by Admin on 2022/04/08.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        VStack{
            Spacer()
            Logo()
            Spacer()
            Comment()
        }
    }
}

struct Logo: View {
    var body: some View {
        VStack{
            Text("내 마음의 안식처")
                .font(.callout)
                .foregroundColor(Color.gray)
            Image("Logo_purple")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 180)
                .clipped()
            Group {
                Text("숨")
                    .font(.largeTitle)
                    .foregroundColor(Color.mainPurple)
                    .fontWeight(.black) +
                Text("은 ")
                    .foregroundColor(Color.gray) +
                Text("쉼")
                    .font(.largeTitle)
                    .foregroundColor(Color.mainPurple)
                    .fontWeight(.black) +
                Text("터")
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct Comment: View {
    var body: some View {
//        Text("당신의 속마음을\n\t당신이 믿는 사람과\n\t\t편하게 공유하는 공간")
        Text("당신의 이야기를 가장 편하게 할 수 있는 공간")
            .font(.body)
            .foregroundColor(Color.gray)
            .padding(.horizontal)
            .padding(.vertical, 50)
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
