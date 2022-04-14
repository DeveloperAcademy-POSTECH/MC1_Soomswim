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
    @Binding private var name: String
    
    // 댓글쓰기 팝업을 위한 변수
    @State private var popUp: Bool = false
    @State private var text: String = "여기에 답장을 남겨주세요"
    @State var nickname = ""
    
    init(name: Binding<String>, story: Story2) {
        self._name = name
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
                                self.popUp = false
                            }) {
                                Text("취소")
                                    .foregroundColor(Color.black)
                            }
                            Button(action: {
                                self.postReply()
                                print("답장 작성 clicked")
                            }) {
                                Text("보내기")
                                .padding(.all, 20)
                            }
                        }
                        if let detailStory = self.detailStory.data{
                            Text("To. \(detailStory.writer.name)")
                                .font(.system(size: 21, weight: .heavy))
                                .frame(width: 300, height: nil, alignment: .leading)
                        } else {
                            Text("To. ")
                                .font(.system(size: 21, weight: .heavy))
                                .frame(width: 300, height: nil, alignment: .leading)
                        }
                        
                        
                        TextEditor(text: self.$text)
                            .foregroundColor(self.text == "여기에 답장을 남겨주세요" ? .gray : .primary)
                            .onTapGesture {
                                if self.text == "여기에 답장을 남겨주세요" {
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
    
    private func postReply() {
        guard let request = try? RequestFactory(url: SoomswimURL.reply).request(params: ["writer": self.nickname, "content": self.text, "sender": self.name, "story": self.story.id]) else { return print("error") }
        NetworkService().request(request, handler: postAccepted)
    }
    
    private func postAccepted(data: Response<String>, response: URLResponse?) -> Void{
        self.popUp = false
    }
}
