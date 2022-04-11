//
//  FriendsListPage.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI

struct FriendsListPage: View {
    private let viewRouter: ViewRouter
    @State private var name: String
    @ObservedObject private var friends = DataLoader<Array<User>>()
    @State private var offer: Bool = false
    @State private var friendName: String = ""
    
    init(name: String, viewRouter: ViewRouter) {
        self.name = name
        self.viewRouter = viewRouter
        self.contents()
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        self.viewRouter.switchPage(.mypage)
                    }) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 12, height: 21)
                            .foregroundColor(Color(uiColor: UIColor.systemGray2))
                    }
                    .padding(.leading, 14)
                    Spacer()
                    HeaderLogo()
                        .padding(.trailing, 12)
                }
                .frame(width: nil, height: 67, alignment: .center)
                HStack {
                    Text("친구 리스트")
                        .font(Font.system(size: 19, weight: .semibold))
                        .padding(.leading, 14.5)
                    Spacer()
                    Button(action: {
                        self.offer = true
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 23, height: 23)
                    })
                    .padding(.trailing, 14.5)
                }
                ScrollView {
                    if let data = self.friends.data {
                        ForEach(data, content: { friend in
                            FriendsList(user: friend)
                        })
                    }
                }
            }
            if self.offer {
                ZStack {
                    Rectangle()
                        .shadow(color: Color.gray, radius: 5)
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 500, alignment: .center)
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.offer = false
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .foregroundColor(Color.gray)
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.trailing, 5)
                            .padding(.top, 10)
                        }
                        .padding(.bottom, 50)
                        Spacer()
                        TextField("Username", text: self.$friendName)
                            .padding(10)
                            .frame(width: 200, height: 50, alignment: .center)
                            .border(.gray, width: 1)
                            .cornerRadius(10)
                        Button(action: {
                            self.follow()
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(Color.mainOrange)
                                    .cornerRadius(10)
                                Text("친구 요청")
                                    .foregroundColor(Color.white)
                                    .font(Font.system(size: 17, weight: .semibold))
                            }
                        }
                        Spacer()
                    }
                }
                .frame(width: 300, height: 500, alignment: .center)
                
            }
        }
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.friends).request(params: ["name": self.name]) else { return print("error") }
        NetworkService().request(request, handler: listup)
    }
    
    private func listup(data: Response<Array<User>>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let friends = data.data
        else { return print("no contents") }
        self.friends.fill(data: friends)
    }
    
    private func follow() {
        guard let request = try? RequestFactory(url: SoomswimURL.friendRequest).request(params: ["name": self.name, "friend": self.friendName]) else { return print("error") }
        NetworkService().request(request, handler: self.followComplete)
    }
    
    private func followComplete(data: Response<String>, response: URLResponse?) {
        self.offer = false
    }
}

struct FriendsListPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendsListPage(name: "Lizzy", viewRouter: ViewRouter())
        }
    }
}
