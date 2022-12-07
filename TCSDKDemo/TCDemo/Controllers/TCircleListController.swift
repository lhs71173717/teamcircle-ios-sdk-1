//
//  TCircleListController.swift
//  TCDemo
//
//  Created by hong on 2022/11/17.
//

import UIKit

class TCircleListController: TBaseController, UITableViewDelegate, UITableViewDataSource {
    
    let lists = [["Circle Controller"], ["Feed module", "UserCenter module", "Search module", "NewPost module"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Circle"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CircleListCell", for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        cell.textLabel?.textColor = UIColor(red: 0, green: 1/255.0, blue: 2/255.0, alpha: 1)
        cell.textLabel?.text = lists[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "CIRCLE GLOBAL"
        }
        return "CIRCLE MODULE"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let vc = TCircleTypeController.initWithMainStoryboard()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            var vc : UIViewController?
            
            switch indexPath.row {
            case 0:
                vc = TFeedController()
            default:
                let controller = TModuleController.initWithMainStoryboard()
                controller.type = TModuleType(rawValue: indexPath.row) ?? .userCenter
                vc = controller
            }
            if let controller = vc {
                navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
