//
//  FriendsList.swift
//  Soomswim
//
//  Created by creohwan on 2022/04/10.
//
import SwiftUI

struct FriendsList: View {
    @State private var request: FriendRequest
    @Binding private var name: String
    
    init(name: Binding<String>, request: FriendRequest) {
        self.request = request
        self._name = name
    }
    
    var body: some View {
      HStack()
      {
          Profile().padding(.trailing, 13.79)
          Text("\(self.request.friend.name)\(self.request.state == .waiting ? " (수락 대기중)" : "")")
              .font(Font.system(size: 15, weight: .semibold))
              .multilineTextAlignment(.leading)
              .lineSpacing(7)
              .padding(.vertical, 19.00)
              .foregroundColor(self.request.state == .waiting ? Color.gray : Color.black)
          Spacer()
          switch self.request.state {
          case .accepted, .waiting :
              Button(action: {
                  self.reject()
              }) {
                  Text("삭제")
                      .font(Font.system(size: 15, weight: .semibold))
                      .foregroundColor(.red)
              }
          case .requested :
              Button(action: {
                  self.reject()
              }) {
                  Text("거절")
                      .font(Font.system(size: 15, weight: .semibold))
                      .foregroundColor(Color.gray)
              }
              Button(action: {
                  self.accept()
              }) {
                  Text("수락")
                      .font(Font.system(size: 15, weight: .semibold))
                      .foregroundColor(.blue)
              }
          case .deleted :
              Button(action: {
                  self.follow()
              }) {
                  Text("요청")
                      .font(Font.system(size: 15, weight: .semibold))
                      .foregroundColor(.red)
              }
          }
          
      }
      .padding(.horizontal, 38.0)
      .frame(width: nil, height: 80, alignment: .center)
    }
    
    private func accept() {
        guard let request = try? RequestFactory(url: SoomswimURL.friendResponse).request(params: ["name": self.name, "friend": self.request.friend.id, "response": true]) else { return print("error")}
        NetworkService().request(request, handler: acceptComplete)
    }
    
    private func reject() {
        guard let request = try? RequestFactory(url: SoomswimURL.friendResponse).request(params: ["name": self.name, "friend": self.request.friend.id, "response": false]) else { return print("error") }
        NetworkService().request(request, handler: rejectComplete)
    }
    
    private func acceptComplete(data: Response<String>, response: URLResponse?) -> Void {
        self.request = FriendRequest(request: self.request, state: .accepted)
    }
    
    private func rejectComplete(data: Response<String>, response: URLResponse?) -> Void {
        self.request = FriendRequest(request: self.request, state: .deleted)
    }
    
    private func follow() {
        guard let request = try? RequestFactory(url: SoomswimURL.friendRequest).request(params: ["name": self.name, "friend": self.request.friend.name]) else { return print("error") }
        NetworkService().request(request, handler: self.followComplete)
    }
    
    private func followComplete(data: Response<String>, response: URLResponse?) {
        self.request = FriendRequest(request: self.request, state: .waiting)
    }
}

struct FriendsList_Previews: PreviewProvider {
    @State static var name: String = "Dinner"
    static var previews: some View {
        Group {
            FriendsList(name: self.$name, request: FriendRequest(id:1, state: .accepted, friend: User(id: 1, name: "Lizzy", profile: "1")))
        }
    }
}
