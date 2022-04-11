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
    @Binding private var name: String
    private let viewRouter: ViewRouter
    
    init(name: Binding<String>, viewRouter: ViewRouter) {
        self._name = name
        self.viewRouter = viewRouter
    }
    
    let columns = [
        GridItem(.fixed(150), spacing: 40),
        GridItem(.fixed(150), spacing: 35)
    ]
    var body: some View {
        NavigationView{
            
            VStack{
                Header(name: self.$name, viewRouter: self.viewRouter)
                ScrollView{
                    VStack(alignment: .center, spacing: 15){
                        Profile()
                        Text(self.name)
                            .font(Font.system(size: 15, weight: .semibold))
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
    @State static private var name = "Lizzy"
    static var previews: some View {
        MyPageView(name: self.$name, viewRouter: ViewRouter())
    }
}
