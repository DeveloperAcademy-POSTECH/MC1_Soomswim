//
//  FriendsListPage.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//

import SwiftUI

struct FriendsListPage: View {
    @State private var name: String
    @ObservedObject private var friendRequests = DataLoader<Array<FriendRequest>>()
    @State private var offer: Bool = false
    @State private var friendName: String = ""
    
    init(name: String) {
        self.name = name
        self.contents()
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("친구 리스트")
                        .font(Font.system(size: 19, weight: .semibold))
                        .padding(.leading, 14.5)
                    Spacer()
                }
                .padding(.top, 10)
                ScrollView {
                    if let data = self.friendRequests.data {
                        ForEach(data, content: { request in
                            FriendsList(name: self.$name, request: request)
                        })
                    }
                }
            }
            if self.offer {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
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
                                    .frame(width: 17, height: 17)
                            }
                            .padding(.trailing, 10)
                            .padding(.top, 10)
                        }
                        .padding(.bottom, 50)
                        Spacer()
                        TextField("Username", text: self.$friendName)
                            .padding(10)
                            .frame(width: 200, height: 50, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        Button(action: {
                            self.follow()
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(Color.pointPurple)
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: BackButton())
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Button(action: {
                self.offer = true
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.gray)
            })
        }
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.friends).request(params: ["name": self.name]) else { return print("error") }
        NetworkService().request(request, handler: listup)
    }
    
    private func listup(data: Response<Array<FriendRequest>>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let friends = data.data
        else { return print("no contents") }
        self.friendRequests.fill(data: friends)
    }
    
    private func follow() {
        guard let request = try? RequestFactory(url: SoomswimURL.friendRequest).request(params: ["name": self.name, "friend": self.friendName]) else { return print("error") }
        NetworkService().request(request, handler: self.followComplete)
    }
    
    private func followComplete(data: Response<String>, response: URLResponse?) {
        self.offer = false
        self.contents()
    }
}

struct FriendsListPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendsListPage(name: "Lizzy")
        }
    }
}
