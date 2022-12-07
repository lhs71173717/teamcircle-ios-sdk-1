//
//  TUserModel.swift
//  TCDemo
//
//  Created by hong on 2022/12/5.
//

import UIKit

struct TUserModel {
    var userId: Int
    var username: String
    var email: String
    var avatar: String
    var bio: String
}

extension TUserModel: Codable, TCachable {
    init(from decoder: Decoder) throws {
        userId = try decoder.decode("userId")
        username = try decoder.decode("username")
        email = try decoder.decode("email")
        avatar = try decoder.decode("avatar") ?? ""
        bio = try decoder.decode("bio") ?? ""
    }
}
