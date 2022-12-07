//
//  ViewController.swift
//  TCDemo
//
//  Created by hong on 2022/11/17.
//

import UIKit
import TeamCircleSDK

class TMainController: TBaseController {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(userLogout), name: NSNotification.Name("TUserLogout"), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        if TAppManager.shared.user == nil {
            TLoginController.showLoginController(vc: self, animated: false)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func userLogout() {
        if let fileURL = FileManager.userFileURL {
            TUserModel.remove(at: fileURL)
        }
        TAppManager.shared.user = nil
        dismiss(animated: false)
        navigationController?.popToRootViewController(animated: false)
        TLoginController.showLoginController(vc: self, animated: false)
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        TCManager.sharedInstance.userLogout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TModuleController {
            if segue.identifier == "toStore" {
                vc.type = .store
            }
            if segue.identifier == "toMessage" {
                vc.type = .message
            }
        }
    }
}

