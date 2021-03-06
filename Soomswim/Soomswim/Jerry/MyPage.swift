//
//  MyPage.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/07.
//

import SwiftUI

struct MyPageView: View {
    @Binding private var name: String
    @ObservedObject private var mystories: DataLoader<Array<Story2>>
    @ObservedObject private var myFriendsCount: DataLoader<Int>
    
    init(name: Binding<String>) {
        self._name = name
        self.mystories = DataLoader<Array<Story2>>()
        self.myFriendsCount = DataLoader<Int>()
        self.contents()
        self.getFriendsCount()
    }
    
    let columns = [
        GridItem(.fixed(150), spacing: 40),
        GridItem(.fixed(150), spacing: 35)
    ]
    var body: some View {
        VStack{
            Header(name: self.$name)
            ScrollView{
                ZStack {
                    VStack {
                        Profile()
                        Text(self.name)
                            .font(Font.system(size: 15, weight: .semibold))
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text("친구")
                                .foregroundColor(Color.pointPurple)
                                .font(Font.system(size: 15, weight: .semibold))
                                .padding(.bottom, 4)
                            NavigationLink(destination: FriendsListPage(name: self.name)) {
                                Text("\(self.myFriendsCount.data ?? 0)")
                                    .foregroundColor(Color(uiColor: UIColor.systemGray))
                                    .font(Font.system(size: 13, weight: .medium))
                            }
                        }
                        .padding(.trailing, 52)
                    }
                }.frame(height: 140)
                VStack(alignment: .leading)
                {
                    Text("나의 페이퍼")
                        .font(Font.system(size: 19, weight: .semibold))
                        .padding()
                    
                    if let mystories = self.mystories.data,
                       mystories.count > 0 {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(Array(zip(Array(0..<mystories.count), mystories)), id: \.0){(idx, mystory) in
                                NavigationLink(destination: MyWritingView(name: self.$name, id: mystory.id)){
                                    MyWritingCardView(name: self.$name, story: mystory)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                        }
                    }
                    else {Text("")}
                }
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .onAppear() {
            self.contents()
        }
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.mypageStories).request(params: ["name": self.name]) else { return print("error") }
        NetworkService().request(request, handler: fillMyStories)
    }

    private func fillMyStories(data: Response<Array<Story2>>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let mystories = data.data
        else { return print("no contents") }
        self.mystories.fill(data: mystories)
    }
    
    private func getFriendsCount() {
        guard let request = try? RequestFactory(url: SoomswimURL.mypageFriends).request(params: ["name": self.name]) else { return print("error") }
        NetworkService().request(request, handler: fillMyFriendsCount)
    }
    
    private func fillMyFriendsCount(data: Response<Int>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let myfriendscount = data.data
        else { return print("no contents") }
        self.myFriendsCount.fill(data: myfriendscount)
    }
    
}

struct MyPageView_Previews: PreviewProvider {
    @State static private var name: String = "Lizzy"

    static var previews: some View {
        MyPageView(name: self.$name)
    }
}
