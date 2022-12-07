//
//  TModuleController.swift
//  TCDemo
//
//  Created by hong on 2022/11/19.
//

import UIKit
import TeamCircleSDK

enum TModuleType: Int {
    case userCenter = 1
    case search = 2
    case newPost = 3
    case store = 4
    case message = 5
}

class TModuleController: TBaseController {
    
    var type : TModuleType = .userCenter
    
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bannerContent: UIView!
    @IBOutlet weak var buttonContent: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewLayout()
    }
    
    func setViewLayout() {
        bannerView.isHidden = true
        let btnFrame = CGRect(x: (buttonContent.frame.width - 44)/2, y: (buttonContent.frame.height - 44)/2, width: 44, height: 44)
        var rightItem: UIBarButtonItem?
        var btnImage : UIImage?
        switch type {
        case .userCenter:
            title = "UserCenter"
            TCManager.sharedInstance.initUserCenterBtn(frame: btnFrame, image: UIImage(named: "usercenter"), title: "") { btn, error in
                if let center = btn {
                    center.navCtrl = navigationController
                    center.imgView.snp.remakeConstraints { (make) in
                        make.center.equalTo(center)
                        make.width.height.equalTo(30)
                    }
                    center.messageCount.snp.remakeConstraints { (make) in
                        make.top.equalTo(0)
                        make.right.equalTo(3)
                        make.height.equalTo(16)
                        make.width.greaterThanOrEqualTo(16)
                    }
                    rightItem = UIBarButtonItem(customView: center)
                }
            }
            btnImage = UIImage(named: "usercenter")
            titleLbl.text = "UserCenter"
        case .search:
            title = "Search"
            TCManager.sharedInstance.initSearchBtn(frame: btnFrame, image: UIImage(named: "research"), title: "") { btn, error in
                if let search = btn {
                    search.widthAnchor.constraint(equalToConstant: 30).isActive = true
                    search.heightAnchor.constraint(equalToConstant: 30).isActive = true
                    rightItem = UIBarButtonItem(customView: search)
                }
            }
            btnImage = UIImage(named: "research")
            titleLbl.text = "Search"
        case .newPost:
            title = "NewPost"
            TCManager.sharedInstance.initNewPostBtn(frame: btnFrame, image: UIImage(named: "newpost"), title: "") { btn, error in
                if let newPost = btn {
                    newPost.widthAnchor.constraint(equalToConstant: 30).isActive = true
                    newPost.heightAnchor.constraint(equalToConstant: 30).isActive = true
                    rightItem = UIBarButtonItem(customView: newPost)
                }
            }
            btnImage = UIImage(named: "newpost")
            titleLbl.text = "NewPost"
        case .store:
            title = "Store"
            bannerView.isHidden = false
            TCManager.sharedInstance.initStoreBtn(frame: CGRectZero) { btn, error in
                if let store = btn {
                    store.navCtrl = navigationController
                    bannerContent.addSubview(store)
                    store.layer.cornerRadius = 5
                    store.snp.remakeConstraints { make in
                        make.center.equalTo(bannerContent)
                        make.left.equalTo(16)
                        make.top.equalTo(16)
                    }
                }
            }
            let store = UIButton(frame: btnFrame)
            store.setImage(UIImage(named: "store 1"), for: .normal)
            store.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            store.widthAnchor.constraint(equalToConstant: 30).isActive = true
            store.heightAnchor.constraint(equalToConstant: 30).isActive = true
            rightItem = UIBarButtonItem(customView: store)
            btnImage = UIImage(named: "store 1")
            titleLbl.text = "Store"
        case .message:
            title = "Instant messaging"
            TCManager.sharedInstance.initIMBtn(frame: btnFrame, image: UIImage(named: "message 1"), title: "") { btn, error in
                if let message = btn {
                    message.navCtrl = navigationController
                    message.imgView.snp.remakeConstraints { (make) in
                        make.center.equalTo(message)
                        make.width.height.equalTo(30)
                    }
                    message.messageCount.snp.remakeConstraints { (make) in
                        make.top.equalTo(0)
                        make.right.equalTo(3)
                        make.height.equalTo(16)
                        make.width.greaterThanOrEqualTo(16)
                    }
                    rightItem = UIBarButtonItem(customView: message)
                }
            }
            btnImage = UIImage(named: "message 1")
            titleLbl.text = "Instant messaging"
        }
        
        let btn = UIButton(frame: btnFrame)
        btn.setImage(btnImage, for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonContent.addSubview(btn)
        
        if let item = rightItem {
            navigationItem.rightBarButtonItem = item
        }
    }
    
    @IBAction func titleAction(_ sender: UIButton) {
        buttonAction()
    }
    
    @objc func buttonAction() {
        switch type {
        case .userCenter:
            TCManager.sharedInstance.toUserCenterVCtrl(nav: navigationController!) { vc, error in
                
            }
        case .search:
            TCManager.sharedInstance.toSearchVCtrl { error in
                
            }
        case .newPost:
            TCManager.sharedInstance.toNewPostVCtrl { error in
                
            }
        case .store:
            TCManager.sharedInstance.toStoreVCtrl(nav: navigationController!) { vc, error in
                
            }
        case .message:
            TCManager.sharedInstance.toChatListAction(nav: navigationController!)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
