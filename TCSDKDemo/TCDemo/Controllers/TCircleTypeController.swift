//
//  TCircleTypeController.swift
//  TCDemo
//
//  Created by hong on 2022/11/19.
//

import UIKit

class TCircleTypeController: TBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Circle"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
