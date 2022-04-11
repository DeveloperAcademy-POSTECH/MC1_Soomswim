//
//  SoomswimURL.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/08.
//

import Foundation

enum SoomswimURL: String {
    
    case login = "login"
    case mypageStory = "mypage/story"
    case reply = "reply"
    case friendRequest = "friend/request"
    case friendResponse = "friend/response"
    case stories = "stories"
    case mypageStories = "mypage/stories"
    case story = "story"
    case repliesreply = "replies/reply"
    case replies = "replies"
    case friends = "friends"
    
    private func URL() -> String {
        let domain = "3.39.28.43"
        return "http://\(domain)/\(self.rawValue)"
    }
    
    func HTTPmethod() -> HTTPMethod {
        switch self {
        case .login, .mypageStory, .reply, .friendRequest, .friendResponse :
            return Post(url: self.URL())
        case .stories, .mypageStories, .story, .repliesreply, .replies, .friends :
            return Get(url: self.URL())
        }
    }
}
