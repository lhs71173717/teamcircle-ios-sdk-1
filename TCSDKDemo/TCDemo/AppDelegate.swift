//
//  AppDelegate.swift
//  TCDemo
//
//  Created by hong on 2022/11/17.
//

import UIKit
import TeamCircleSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TCManager.sharedInstance.initSDK(appId: "cojksawr", appKey: "d6526542a1c247c399aa41e66122118f", delegate: self, theme: .light)
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

extension AppDelegate : TCManagerDelegate {
    func messageChanged(count: Int) {
        
    }
    
    func notificationStateChanged(count: Int) {
        
    }
    
    func shareJsonDownloaded(json: TCShareViewModel) {
        
    }
    
    func teamCirleAccountProfileChange(accountName: String, avatarUrl: String, bio: String) {
        if var user = TAppManager.shared.user {
            user.username = accountName
            user.avatar = avatarUrl
            user.bio = bio
            TAppManager.shared.user = user
            TAppManager.shared.changeUserInfo()
        }
    }
    
    func teamCirleFail(error: NSError) {
        if error.code == 20003 {
            if let vc = getCurrentViewController() {
                if vc is TLoginController {
                    return
                }
                TLoginController.showLoginController(vc: vc)
            }
        }
        debugPrint(error)
    }
    
    func teamCirleSDKInit() {
        
    }
    
    func teamCirleAccountLogin() {
        
    }
    
    func teamCirleAccountLogout() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TUserLogout"), object: nil)
    }
    
    func teamCirleDeleteAccount() {
        
    }
}
