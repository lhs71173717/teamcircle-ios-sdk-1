//
//  TAppManager.swift
//  TCDemo
//
//  Created by hong on 2022/12/5.
//

import UIKit

class TAppManager: NSObject {
    static let shared = TAppManager()
    
    var user: TUserModel? {
        didSet {
            if let fileURL = FileManager.userFileURL {
                user?.save(at: fileURL)
            }
        }
    }
    
    override init() {
        if let fileURL = FileManager.userFileURL, let userModel = TUserModel.get(fromCache: fileURL) {
            user = userModel
        }
    }
}

extension TAppManager: Requestable {
    func changeUserInfo() {
        if let user = TAppManager.shared.user {
            request(.userInfo(userId: user.userId, username: user.username, avatar: user.avatar, bio: user.bio)).responseStatus { status in
                if let msg = status.message {
                    debugPrint(msg)
                }
            }
        }
    }
}
