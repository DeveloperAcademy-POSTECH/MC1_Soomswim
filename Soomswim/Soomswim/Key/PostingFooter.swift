//
//  PostingFooter.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/12.
//

import SwiftUI

struct PostingFooter: View {
    @State private var offer: Bool = false
    @State private var text: String = "여기에 글을 남겨주세요"
    @State var nickname = ""
    
    private let name: String
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        ZStack{
            HStack {
                Spacer()
                // 댓글쓰기 버튼
                Button(action: {
                    self.offer = true
                }) {
                    Text("댓글쓰기")
                        .foregroundColor(Color.green)
                    Image(systemName: "square.and.pencil")
                          .resizable()
                          .foregroundColor(Color.green)
                          .frame(width: 20, height: 20)
                }
                .padding(.all, 10)
                .padding(.trailing)
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
                                // 수정필요: back-end 붙이기
                                print("댓글 작성 clicked")
                            }) {
                                Text("보내기")
                                    .foregroundColor(Color.blue)
                            }
                            Button(action: {
                                self.offer = false
                            }) {
                                Text("취소")
                                    .foregroundColor(Color.black)
                            .padding(.all, 20)
                            }
                        }
                        // 수정필요: 게시글 작성자 name 넣어야 함
                        Text("To.\(name)")
                            .font(.system(size: 21, weight: .heavy))
                            .frame(width: 250, height: nil, alignment: .leading)
                        
                        TextEditor(text: self.$text)
                            .foregroundColor(self.text == "여기에 글을 남겨주세요" ? .gray : .primary)
                            .onTapGesture {
                                if self.text == "여기에 글을 남겨주세요" {
                                    self.text = ""
                                }
                                    
                            }
                            .disableAutocorrection(true)
                            .padding()
                        HStack() {
                            Spacer()
                            Text("From.")
                            TextField("익명", text: $nickname)
                        }
                        .font(.system(size: 21, weight: .heavy))
                        .padding(.all, 20)
                        .padding(.leading, 120)
                    }
                }
                .frame(width: 300, height: 500, alignment: .center)
                .padding(.bottom, 50)
            }
        }
    }
}
