//
//  Posting.swift
//  Soomswim
//
//  Created by Admin on 2022/04/11.
//

import SwiftUI

struct PostingHeader: View {
    var body: some View {
        HStack {
            Button(action: {
                print("clicked 뒤로가기")
            }) {
                Image(systemName: "chevron.backward")
                      .resizable()
                      .foregroundColor(Color.black)
                      .frame(width: 15, height: 20)
            }
                .padding()
            Spacer()
            Group {
                Text("S")
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color.mainPurple)
                    .font(.system(size: 25)) +
                Text("oom")
                    .italic()
                    .fontWeight(.black)
                    .font(.system(size: 21)) +
                Text("s")
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color.mainPurple)
                    .font(.system(size: 25)) +
                Text("wim")
                    .italic()
                    .fontWeight(.black)
                    .font(.system(size: 21))
            }
                .frame(width: 130, height: 30, alignment: .center)
                .padding()
        }
    }
}

struct PostingUser: View {
    var body: some View {
        HStack()
        {
            Profile().padding(.trailing, 13.79)
            Text("Dinner")
                .font(Font.system(size: 15, weight: .semibold))
                .multilineTextAlignment(.leading)
                .lineSpacing(7)
                .padding(.vertical, 19.00)
            Spacer()
        }
        .padding(.horizontal, 38.0)
        .frame(width: nil, height: 80, alignment: .center)
    }
}

struct PostingFooter: View {
    var body: some View {
        HStack {
            Spacer()
            // 이모지 버튼
            Button(action: {
                print("clicked 감정표현")
            }) {
                Image(systemName: "face.smiling")
                      .resizable()
                      .foregroundColor(Color.orange)
                      .frame(width: 20, height: 20)
            }
            .padding(.all, 10)
            // 댓글쓰기 버튼
            Button(action: {
                print("clicked 댓글쓰기")
            }) {
                Image(systemName: "square.and.pencil")
                      .resizable()
                      .foregroundColor(Color.green)
                      .frame(width: 20, height: 20)
            }
            .padding(.all, 10)
            .padding(.trailing)
        }
    }
}

struct Posting: View {
    private let viewRouter: ViewRouter
    private let storyId: Int
    @State var contentsText: String = "방황하였으며, 영원히 새 오직 커다란 그들의 칼이다. 과실이 따뜻한 많이 이것이다. 예수는 봄바람을 피고, 굳세게 할지니, 이것이야말로 수 사라지지 이는 이것이다. 것은 설레는 싶이 있다. 광야에서 대고, 원질이 더운지라 뿐이다. 무엇을 든 설산에서 생의 위하여, 이것을 사는가 속에서 그리하였는가? 낙원을 사람은 옷을 얼음과 끓는다. 인간의 얼마나 사랑의 꾸며 그들의 봄바람이다. 유소년에게서 인간의 우리의 꽃 얼마나 긴지라 인간이 있음으로써 보이는 그리하였는가?\n\n것이 그러므로 곧 가지에 대한 광야에서 이것이다. 내는 전인 동력은 찾아다녀도, 살 그림자는 있다. 발휘하기 따뜻한 인간의 구하지 장식하는 이상의 그들의 피다. 평화스러운 열락의 그림자는 인도하겠다는 사막이다. 용기가 없으면, 뼈 위하여서 동력은 크고 같지 그들의 운다. 이것을 뜨고, 열락의 힘있다. 피부가 꾸며 별과 피에 듣는다. 그들에게 품었기 거선의 밝은 낙원을 끓는다. 하였으며, 굳세게 그러므로 끝까지 천자만홍이 심장의 뿐이다. 착목한는 것은 곧 싸인 되려니와, 모래뿐일 만물은 속잎나고, 이것이다. 하는 풍부하게 영원히 우리 불어 바이며, 별과 무한한 하였으며, 봄바람이다.\n\n사라지지 커다란 기관과 별과 붙잡아 불러 동산에는 끓는다. 꾸며 충분히 인간의 역사를 이것이다. 들어 청춘은 두기 동산에는 않는 광야에서 가는 현저하게 위하여서 황금시대다. 영원히 인생에 얼마나 위하여, 갑 피어나기 품에 원대하고, 운다. 청춘 반짝이는 곧 원대하고, 현저하게 품고 봄바람이다. 얼마나 피는 전인 목숨이 그들의 남는 가는 이것이다. 찬미를 앞이 피고, 간에 이상은 무한한 끓는 얼음 것이다. 고동을 심장의 얼음에 주는 운다. 바로 커다란 커다란 청춘의 있으랴? 심장의 수 하여도 풀이 구할 이상이 같이, 오아이스도 끝까지 피다. 시들어 같이 군영과 인간은 이것은 밥을 것이다.\n\n생의 인생을 인도하겠다는 그것은 부패뿐이다. 군영과 얼마나 피고 것이다. 맺어, 것은 무엇이 고행을 시들어 우리 모래뿐일 거친 이는 봄바람이다. 붙잡아 희망의 현저하게 뿐이다. 이것을 불어 위하여 수 힘차게 따뜻한 뿐이다. 갑 어디 풀밭에 피다. 가지에 붙잡아 품었기 열락의 속잎나고, 사랑의 싸인 어디 것이다. 얼마나 사람은 품으며, 얼음과 길을 쓸쓸한 품었기 살았으며, 위하여 약동하다. 그들의 품었기 간에 물방아 있는 것이다. 방황하여도, 미묘한 있는 것이다. 생명을 끓는 풀이 사람은 아니다.\n\n천지는 수 위하여 얼음이 바이며, 하여도 별과 사라지지 교향악이다. 이는 우리 황금시대의 커다란 철환하였는가? 속에 맺어, 때까지 힘있다. 청춘의 그들은 찾아다녀도, 인간이 얼음이 고행을 얼마나 끓는 가슴이 있는가? 간에 바로 천고에 부패뿐이다. 인생에 그들에게 이상 너의 운다. 쓸쓸한 피어나기 그들은 이상은 하는 갑 없는 따뜻한 그리하였는가? 열매를 인도하겠다는 불어 풀이 품에 말이다. 대한 관현악이며, 피고, 그들에게 위하여서. 끓는 아니더면, 대고, 인생에 때에, 원질이 쓸쓸한 길지 피어나기 사막이다.\n\n이것이야말로 피가 심장의 부패를 것이다. 귀는 노년에게서 청춘을 사랑의 이상을 같이, 그리하였는가? 낙원을 가는 그러므로 뛰노는 교향악이다. 않는 우리는 유소년에게서 날카로우나 보는 칼이다. 동산에는 그것은 인간이 위하여 밥을 용기가 이것이다. 석가는 청춘에서만 바로 투명하되 얼음과 보라. 불어 있는 못할 없으면, 들어 말이다. 피어나는 뛰노는 가치를 있다. 붙잡아 미묘한 지혜는 이 내려온 꽃 열매를 이상의 그리하였는가? 위하여, 인간의 관현악이며, 천하를 말이다. 가치를 보이는 얼마나 충분히 피고 위하여서, 가슴이 설레는 아름다우냐?\n\n방황하였으며, 끓는 투명하되 이것이다. 위하여 있는 열매를 구할 밝은 풀밭에 힘차게 칼이다. 반짝이는 부패를 심장은 목숨을 피에 못할 가치를 쓸쓸하랴? 구할 사랑의 피가 청춘의 인간의 충분히 생명을 전인 있다. 것이 꽃 곳으로 꽃이 가치를 예수는 석가는 할지라도 운다. 무한한 투명하되 얼마나 불러 아름다우냐? 것이 놀이 얼마나 동력은 아니다. 모래뿐일 어디 못할 이성은 찾아다녀도, 살 때문이다. 그들의 고동을 피는 과실이 고행을 피부가 이것이다. 그들을 피어나는 품으며, 힘차게 크고 얼음과 것이다. 열락의 대고, 크고 때문이다.\n\n없으면 따뜻한 같은 얼음 뜨거운지라, 인생에 실현에 이것이다. 이상 군영과 없으면, 소금이라 같지 같은 뿐이다. 찬미를 청춘 아니한 황금시대를 위하여 가장 황금시대다. 구하지 일월과 관현악이며, 꾸며 봄바람이다. 뭇 사람은 피가 이상은 착목한는 속잎나고, 앞이 되려니와, 바이며, 사막이다. 열매를 곳이 긴지라 새 있음으로써 천지는 고행을 같지 행복스럽고 때문이다. 새가 생생하며, 우리는 품었기 쓸쓸한 작고 아름다우냐? 모래뿐일 새가 그들의 봄날의 눈이 그들에게 교향악이다. 그들의 트고, 못할 너의 든 역사를 봄바람이다. 밝은 할지니, 무한한 쓸쓸하랴?\n\n미묘한 트고, 공자는 이것이다. 평화스러운 끓는 풀이 많이 온갖 듣는다. 우리 그들의 가슴에 때까지 같은 열락의 무엇을 같이, 뿐이다. 그들은 할지라도 이 이성은 보라. 낙원을 천하를 인간의 청춘이 공자는 듣는다. 든 갑 보는 바이며, 싹이 봄바람이다. 없는 구할 실현에 얼마나 심장의 역사를 사막이다. 이상 속에서 바이며, 만물은 얼마나 청춘의 황금시대를 피가 듣는다. 뜨고, 있는 가슴이 싹이 교향악이다.\n\n그들은 목숨이 가는 것은 운다. 가지에 산야에 곳이 철환하였는가? 심장의 끓는 갑 놀이 인도하겠다는 거친 오아이스도 남는 얼음이 듣는다. 끓는 있음으로써 그들은 듣는다. 길지 이상, 인도하겠다는 물방아 얼음에 살 풀이 어디 것이다. 별과 때에, 뛰노는 인생을 때문이다. 살았으며, 능히 눈에 지혜는 사랑의 인생의 투명하되 시들어 있다. 몸이 너의 피에 주는 관현악이며, 얼음이 듣는다. 장식하는 사람은 청춘의 설레는 능히 과실이 이상 무엇을 없으면, 것이다.\n\n반짝이는 노년에게서 더운지라 바이며, 이상을 주며, 그들의 인간의 꽃이 교향악이다. 못할 낙원을 청춘의 얼마나 가는 무엇을 있는 사람은 너의 있다. 있는 생명을 예수는 이상의 청춘이 심장은 영원히 실현에 속에서 것이다. 얼마나 커다란 노년에게서 충분히 목숨이 위하여 아름다우냐? 뜨고, 우는 열락의 것이다. 뭇 풍부하게 사람은 너의 피가 피다. 능히 그들의 꽃 아니다. 인생을 같은 청춘의 얼마나 고행을 구하지 그들은 듣는다. 끓는 능히 현저하게 봄바람이다. 있는 고행을 주며, 창공에 이상 것은 하여도 못할 듣는다. 이것을 대한 것은 이상의 속에서 광야에서 싹이 주는 말이다.\n\n못하다 청춘의 곳이 쓸쓸하랴? 이상이 위하여 수 청춘을 수 것은 청춘은 끝에 봄바람이다. 것은 청춘을 무엇을 스며들어 청춘 황금시대다. 두기 인생에 끝까지 듣는다. 곧 얼음과 생생하며, 기관과 발휘하기 수 따뜻한 대한 것이다. 그들의 목숨이 되려니와, 사라지지 안고, 기관과 말이다. 우리의 방지하는 그러므로 있다. 만천하의 못할 가는 뭇 낙원을 대고, 같으며, 사막이다. 얼마나 옷을 낙원을 이상 듣는다. 따뜻한 풍부하게 청춘의 가장 인생의 능히 쓸쓸하랴? 것이다.보라, 위하여 곳으로 위하여 피다."
    
    init(viewRouter: ViewRouter, storyId: Int) {
        self.viewRouter = viewRouter
        self.storyId = storyId
    }
    
    var body: some View {
        VStack {
            PostingHeader()
                .frame(width: nil, height: nil, alignment: .top)
            ScrollView{
                PostingUser()
                Seperator()
                Text("\(contentsText)")
                    .padding(.all, 20)
                    .lineSpacing(10)
            }
            PostingFooter()
                .frame(width: nil, height: nil, alignment: .bottom)
        }
    }
}

struct Posting_Previews: PreviewProvider {
    static var previews: some View {
        Posting(viewRouter: ViewRouter(), storyId: 1)
    }
}
