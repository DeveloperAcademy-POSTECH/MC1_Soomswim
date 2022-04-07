//
//  MyWriting.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/06.
//

import SwiftUI

extension Int {
  var hour: Int {
    self / 3600
  }
  var minute: Int {
    (self % 3600) / 60
  }
  var seconds: Int {
    (self % 60)
  }
}

func isOpenEnable(writingDateString: String) -> Bool {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let writingDate = dateFormatter.date(from: writingDateString)!
    let openDate = writingDate.addingTimeInterval(3600 * 8)
    let currentDate = Date()
    
    return openDate < currentDate
}

func getRemainTime(writingDateString: String) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let writingDate = dateFormatter.date(from: writingDateString)!
    let openDate = writingDate.addingTimeInterval(3600 * 8)
    let currentDate = Date()
    
    let remainUTC = openDate.timeIntervalSince(currentDate)
    
    let remainUTCInteger = Int(remainUTC)
    
    return remainUTCInteger
}

struct MyWriting: View {
    static var testDate = "2022-04-07 00:00:00"
    @State var isOpenTime = isOpenEnable(writingDateString: testDate)
    @State var remainTime = getRemainTime(writingDateString: testDate)
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 15) {
                    Text("2022.04.06")
                        .font(Font.system(size: 24, weight: .semibold))
                    Text("새가 붙잡아 미인을 우리 사막이다. 얼음에 이상, 살 가지에 사막이다. 가는 뭇 새 있는 인생의 주는 부패뿐이다. 황금시대의 청춘의 위하여, 위하여 속에서 하였으며, 같은 인간에 얼마나 것이다. 뛰노는 그림자는 주는 힘차게 그들의 봄바람이다. 이성은 꾸며 소담스러운 밝은 싶이 그들에게 없으면, 노년에게서 부패뿐이다.\n\n 군영과 사람은 놀이 내는 관현악이며, 그들에게 쓸쓸하랴? 것이다.보라, 그러므로 그들에게 같이, 원대하고, 위하여 하였으며, 옷을 끓는다. 아름답고 가슴에 남는 것이 사막이다. 지혜는 웅대한 끓는 목숨을 역사를 싸인 인생에 풀밭에 교향악이다. 이 불어 인생을 싸인 설레는 힘있다.")
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 15, weight: .regular))
                        .lineSpacing(5)
                }
                .padding(EdgeInsets(top: 20, leading: 26, bottom: 0, trailing: 26))
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(isOpenTime ? "답변 보기" : "답변 보기까지 \(remainTime.hour)시간 \(remainTime.minute)분 남음", destination: ReplyToWriting(color: .purple))
                        .disabled(!isOpenTime)
                }
            }
        }
    }
        
}

struct MyWriting_Previews: PreviewProvider {
    static var previews: some View {
        MyWriting()
            .previewInterfaceOrientation(.portrait)
    }
}
