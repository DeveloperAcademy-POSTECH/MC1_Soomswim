//
//  Login.swift
//  SoomshimUI
//
//  Created by Admin on 2022/04/06.
//

import SwiftUI

extension Color {
    static let subPurple: Color = Color(red: 120/255, green: 59/255, blue: 139/255)
    static let mainPurple: Color = Color(red: 228/255, green: 198/255, blue: 255/255)
    static let lightGray: Color = Color(red: 240/255, green: 240/255, blue: 245/255)
}

struct Login: View {
    @State var username: String = ""
    private let viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        VStack {
            LogoEnglish()
            LogoImage()
            UserNameField(username: self.$username)
            LoginButton(username: self.$username, handler: switchPage)
        }
    }
    
    func switchPage(data: Response<String>, response: URLResponse?) -> Void {
        UserDefaults.standard.set(self.username, forKey: "name")
        self.viewRouter.user(self.username)
        self.viewRouter.switchPage(.feed)
    }
}

struct LogoEnglish: View {
    var body: some View {
        Group {
            Text("S")
                .italic()
                .fontWeight(.black)
                .foregroundColor(Color.mainPurple)
                .font(.system(size: 50)) +
            Text("oom")
                .italic()
                .fontWeight(.black)
                .font(.system(size: 40)) +
            Text("s")
                .italic()
                .fontWeight(.black)
                .foregroundColor(Color.mainPurple)
                .font(.system(size: 50)) +
            Text("wim")
                .italic()
                .fontWeight(.black)
                .font(.system(size: 40))
        }
            .frame(width: 250, height: 100, alignment: .center)
            .padding()
        
//        Text("Soomswim")
//            .italic()
//            .fontWeight(.black)
//            .lineSpacing(25)
//            .font(.system(size: 40))
//            .frame(width: 250, height: 100, alignment: .center)
//            .padding()
    }
}

struct LogoImage: View {
    var body: some View {
        VStack{
//            Text("내 마음의 안식처")
//                .font(.callout)
//                .foregroundColor(Color.gray)
            Image("playstore")
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
    @Binding private var username: String
    
    init(username: Binding<String>) {
        self._username = username
    }
    
    var body: some View {
        return TextField("Username", text: self.$username)
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
            .frame(width: 200, height: 60)
            .background(Color.mainPurple)
            .cornerRadius(20.0)
    }
}

struct LoginButton: View {
    private let handler: (Response<String>, URLResponse?) -> Void
    @Binding private var username: String
    
    init(username: Binding<String>, handler: @escaping (Response<String>, URLResponse?) -> Void) {
        self._username = username
        self.handler = handler
    }
    
    var body: some View {
        Button(action: {
            guard let request = try? RequestFactory(url: SoomswimURL.login).request(params: ["name": self.username]) else { return print("error") }
            NetworkService().request(request, handler: {
                self.handler($0, $1)
            })
        }) {
            LoginButtonContent()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(viewRouter: ViewRouter())
    }
}
