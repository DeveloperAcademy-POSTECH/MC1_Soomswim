//
//  Posting.swift
//  Soomswim
//
//  Created by Admin on 2022/04/11.
//

import SwiftUI

struct Posting: View {
    private let story: Story2
    @ObservedObject private var detailStory: DataLoader<Story2>
    
    // 댓글쓰기 팝업을 위한 변수
    @State private var popUp: Bool = false
    @State private var text: String = "여기에 댓글을 남겨주세요"
    @State var nickname = ""
    
    init(story: Story2) {
        self.story = story
        self.detailStory = DataLoader<Story2>()
        self.contents()
    }
    
    var body: some View {
        ZStack {
            VStack {
                if let detailStory = self.detailStory.data {
                    ScrollView{
                        PostingUser(name: detailStory.writer.name)
                        Seperator()
                        Text("\(detailStory.content)")
                            .padding(.all, 20)
                            .lineSpacing(10)
                    }
                }
                // 수정필요: 이름 받아와야 함
                PostingFooter(popUp: $popUp)
                    .frame(width: nil, height: nil, alignment: .bottom)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: BackButton())
            .navigationBarBackButtonHidden(true)
            .toolbar {
                LogoEnglish()
            }
            
            if $popUp.wrappedValue {
                ZStack {
                    Color.white
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
                                self.popUp = false
                            }) {
                                Text("취소")
                                    .foregroundColor(Color.black)
                            .padding(.all, 20)
                            }
                        }
                        // 수정필요: 게시글 작성자 name 넣어야 함
                        Text("To. Eddy")
                            .font(.system(size: 21, weight: .heavy))
                            .frame(width: 300, height: nil, alignment: .leading)
                        
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
                        .padding(.leading, 180)
                    }
                }
                .frame(width: 360, height: 400, alignment: .center)
                .cornerRadius(10).shadow(radius: 20)
            }
        }
        .padding()
    }
    
    private func contents() {
        guard let request = try? RequestFactory(url: SoomswimURL.story).request(params: ["name": self.story.writer.name, "story": self.story.id]) else { return print("error") }
        NetworkService().request(request, handler: fillContents)
    }
    
    private func fillContents(data: Response<Story2>, response: URLResponse?) {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let story = data.data
        else { return print("no contents") }

        self.detailStory.fill(data: story)
    }
}
