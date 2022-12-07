//
//  Route.swift
//  SmartLED
//
//  Created by Samuel on 2019/11/4.
//  Copyright © 2019 Haogang Chen. All rights reserved.
//

import Foundation
import Alamofire

enum Route {
    case userLogin(username: String, email: String)
    case userInfo(userId: Int, username: String, avatar: String, bio: String)
    case userLogout(userId: Int)
    
    var requestProperties: (method: HTTPMethod, path: String, query: Parameters?) {
        switch self {
        case let .userLogin(username, email):
            return (.post, "/demo/v1/user/login", ["username": username, "email": email])
        case let .userInfo(userId, username, avatar, bio):
            return (.post, "/demo/v1/user/users/\(userId)", ["username": username, "avatar": avatar, "bio": bio])
        case let .userLogout(userId):
            return (.get, "/demo/v1/user/logout", ["userId": userId])
            
        default:
            return (.get, "", nil)
        }
    }
}
