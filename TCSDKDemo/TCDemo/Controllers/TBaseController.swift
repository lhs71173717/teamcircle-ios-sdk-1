//
//  TBaseController.swift
//  TCDemo
//
//  Created by hong on 2022/11/17.
//

import UIKit

class TBaseController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if navigationController?.viewControllers.count ?? 0 > 1 {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backAction))
            navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }

}


