//
//  TFeedController.swift
//  TCDemo
//
//  Created by hong on 2022/11/19.
//

import UIKit
import TeamCircleSDK

class TFeedController: TBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Feed"
        TCManager.sharedInstance.initFeedController(nav: navigationController!) { feed, error in
            if let vc = feed {
                addChild(vc)
                view.addSubview(vc.view)
                vc.view.snp.remakeConstraints { make in
                    make.edges.equalTo(0)
                }
            }
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
