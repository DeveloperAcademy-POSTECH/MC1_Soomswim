//
//  FriendRequest.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/11.
//

import Foundation

enum RequestState: Int, Codable {
    case accepted = 0, waiting = 1, requested = 2, deleted = 3
}

struct FriendRequest: Codable, Identifiable {
    let id: Int
    let state: RequestState
    let friend: User
    
    init(id: Int, state: RequestState, friend: User) {
        self.id = id
        self.state = state
        self.friend = friend
    }
    
    init(request: Self, state: RequestState) {
        self.id = request.id
        self.state = state
        self.friend = request.friend
    }
}
