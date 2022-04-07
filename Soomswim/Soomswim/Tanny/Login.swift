//
//  Login.swift
//  SoomshimUI
//
//  Created by Admin on 2022/04/06.
//

import SwiftUI

extension Color {
    static let mainGreen: Color = Color(red: 163/255, green: 246/255, blue: 168/255)
    static let mainMidOrange: Color = Color(red: 241/255, green: 203/255, blue: 134/255)
    static let mainOrange: Color = Color(red: 255/255, green: 87/255, blue: 0)
    static let mainPurple: Color = Color(red: 120/255, green: 59/255, blue: 139/255)
    static let lightGray: Color = Color(red: 240/255, green: 240/255, blue: 245/255)
}

struct Login: View {
    @State var username: String = ""
    
    var body: some View {
        VStack {
            LogoEnglish()
            LogoImage()
            UserNameField()
            LoginButton()
        }
    }
}

struct LogoEnglish: View {
    var body: some View {
        HStack {
            LinearGradient(gradient: Gradient(colors: [Color.mainOrange, Color.mainMidOrange, Color.mainGreen]),
                           startPoint: .leading,
                           endPoint: .trailing)
            .mask(self.logo)
            .frame(width: 250, height: 100, alignment: .center)
            .padding()
        }
        .frame(width: nil, height: nil, alignment: .center)
    }
    
    private var logo: some View {
        Text("Soomswim")
            .italic()
            .fontWeight(.black)
            .lineSpacing(25)
            .font(.system(size: 40))
    }
}

struct LogoImage: View {
    var body: some View {
        VStack{
//            Text("내 마음의 안식처")
//                .font(.callout)
//                .foregroundColor(Color.gray)
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
            .padding(.bottom, 30)
    }
}

struct UserNameField: View {
    @State var username: String = ""
    
    var body: some View {
        return TextField("Username", text: $username)
            .padding()
            .background(Color.lightGray)
            .cornerRadius(5.0)
            .padding(.horizontal, 80)
            .padding(.vertical, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct LoginButton: View {
    var body: some View {
        Button(action: {print("Button tapped")}) {
            LoginButtonContent()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
