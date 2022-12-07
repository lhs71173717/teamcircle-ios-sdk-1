//
//  TLoginController.swift
//  TCDemo
//
//  Created by hong on 2022/12/3.
//

import UIKit
import Alamofire
import TeamCircleSDK

let userNameKey = "TUserNameKey"
let emailKey = "TEmailKey"

class TLoginController: TBaseController, Requestable {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    class func showLoginController(vc: UIViewController, animated: Bool = true) {
        let loginVC = TLoginController.initWithMainStoryboard()
        loginVC.modalPresentationStyle = .fullScreen
        vc.present(loginVC, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.cornerRadius = 8
        loginBtn.layer.masksToBounds = true
        loadUserData()
    }
    
    func loadUserData() {
        if let nameStr = UserDefaults.standard.string(forKey: userNameKey) {
            userName.text = nameStr
        }
        if let emailStr = UserDefaults.standard.string(forKey: emailKey) {
            email.text = emailStr
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let username = userName.text, let email = email.text else { return }
        request(.userLogin(username: username, email: email)).responseDecodableObject { [weak self] (response: DataResponse<TUserModel>) in
            if let error = response.error {
                debugPrint("failed: \(error.localizedDescription)")
                return
            }
            if let user = response.value {
                TAppManager.shared.user = user
                TCManager.sharedInstance.userLogin(userId: "\(user.userId)", userName: user.username, avatarUrl: user.avatar, userEmail: user.email, userBio: user.bio)
                let stand = UserDefaults.standard
                stand.set(username, forKey: userNameKey)
                stand.set(email, forKey: emailKey)
                stand.synchronize()
                self?.dismiss(animated: true)
            }
        }
    }
}
