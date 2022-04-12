//
//  MyPage.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/07.
//

import SwiftUI
//extension UINavigationController {
//    // Remove back button text
//    open override func viewWillLayoutSubviews() {
//        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//    }
//}

struct MyPageView: View {
    var storys : [Story] = loadJson()
    var nickname : String = "내 닉네임"
    private let viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    let columns = [
        GridItem(.fixed(150), spacing: 40),
        GridItem(.fixed(150), spacing: 35)
    ]
    var body: some View {
        NavigationView{
            VStack{
                Header()
                ScrollView{
                    ZStack {
                        VStack {
                            Profile()
                            Text(nickname)
                                .font(Font.system(size: 15, weight: .semibold))
                        }
                        HStack {
                            Spacer()
                            VStack {
                                Text("친구")
                                    .foregroundColor(Color.mainOrange)
                                    .font(Font.system(size: 15, weight: .semibold))
                                    .padding(.bottom, 4)
                                Button(action: {
                                    self.viewRouter.switchPage(.friends)
                                }) {
                                    Text("00")
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
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(storys) {story in
                                NavigationLink(destination: MyWritingView(story: story)){
                                    MyWritingCardView(story: story)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(viewRouter: ViewRouter())
    }
}
