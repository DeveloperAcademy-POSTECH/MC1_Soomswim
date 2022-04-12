//
//  BeforePostInputView.swift
//  soomswimProject
//
//  Created by 지준용 on 2022/04/07.
//

import SwiftUI

struct BeforePostInputView: View {
    @State var isActive : Bool = false

    var body: some View {
        NavigationView{
            NavigationLink(destination: PostInputView(name: "Lizzy"), isActive: self.$isActive){
                Text("게시글 작성페이지로")
                }
                .isDetailLink(false)
        }
        
    }
}

struct BeforePostInputView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePostInputView()
    }
}
