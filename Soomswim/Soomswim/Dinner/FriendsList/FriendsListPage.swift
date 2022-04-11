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
    
    init(name: String, viewRouter: ViewRouter) {
        self.name = name
        self.viewRouter = viewRouter
        self.contents()
    }
    
    var body: some View {
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
                    print("search")
                }, label: {
                    Image(systemName: "magnifyingglass")
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
                                 
}

struct FriendsListPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendsListPage(name: "Lizzy", viewRouter: ViewRouter())
        }
    }
}
