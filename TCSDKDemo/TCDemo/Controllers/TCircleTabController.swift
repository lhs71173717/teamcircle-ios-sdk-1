//
//  TCircleTabController.swift
//  TCDemo
//
//  Created by hong on 2022/11/19.
//

import UIKit

class TCircleTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
