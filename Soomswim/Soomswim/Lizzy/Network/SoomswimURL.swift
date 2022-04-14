//
//  SoomswimURL.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/08.
//

import Foundation

enum SoomswimURL: String {
    
    case login = "login"
    case mypageStroy = "mypage/story"
    case reply = "reply"
    case friendRequest = "friend/request"
    case friendResponse = "friend/response"
    case stories = "stories"
    case mypageStories = "mypage/stories"
    case story = "story"
    case repliesreply = "replies/reply"
    case replies = "replies"
    case friends = "friends"
    case mypageFriends = "mypage/friends"
    
    private func URL() -> String {
        let domain = "3.39.28.43"
        return "http://\(domain)/\(self.rawValue)"
    }
    
    func HTTPmethod() -> HTTPMethod {
        switch self {
        case .login, .mypageStroy, .reply, .friendRequest, .friendResponse :
            return Post(url: self.URL())
        case .stories, .mypageStories, .story, .repliesreply, .replies, .friends, .mypageFriends :
            return Get(url: self.URL())
        }
    }
}
