//
//  Login.swift
//  SoomshimUI
//
//  Created by Admin on 2022/04/06.
//

import SwiftUI

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
        self.viewRouter.switchPage(.home)
    }
}

struct LogoEnglish: View {
    var body: some View {
        Image("Logo")
            .resizable()
            .frame(width: 119, height: 25, alignment: .center)
            .padding()
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
