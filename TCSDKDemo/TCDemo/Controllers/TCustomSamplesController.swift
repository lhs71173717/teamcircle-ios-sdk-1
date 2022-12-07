//
//  TCustomSamplesController.swift
//  TCDemo
//
//  Created by hong on 2022/11/19.
//

import UIKit

enum TCustomSamplesType {
    case normal
    
    case setTextFontRegular
    case setTextFontBold
    case setTextFontAction
    case setTextFontProductName
    case setTextFontProductPrice
    case setProductDescColor
    
    case setIconFavorite
    case setIconFavoriteSelected
    case setIconTag
    case setIconTagSelected
    case setIconLike
    case setIconLikeSelected
    case setIconShare
    case setIconComment
    case setIconNewPost
    case setIconBack
    case setSystemBackgroundColor
    case setBackgroundEffectColor
    case setLinkColor
    
    case toStoreVCtrl
    case toUserCenterVCtrl
    case toNewPostVCtrl
    case toSearchVCtrl
    case toChatListAction
    case toChatAction
    
    case setPrivacyPolicy
    case setTermsAndConditions
}

class TCustomSamplesController: TBaseController, UITableViewDelegate, UITableViewDataSource {

    let datas : [[TCustomSamplesType]] = [[.normal], [.setTextFontRegular, .setTextFontBold, .setTextFontAction, .setTextFontProductName, .setTextFontProductPrice, .setProductDescColor], [.setIconFavorite, .setIconFavoriteSelected, .setIconTag, .setIconTagSelected, .setIconLike, .setIconLikeSelected, .setIconShare, .setIconComment, .setIconNewPost, .setIconBack], [.setSystemBackgroundColor, .setBackgroundEffectColor, .setLinkColor], [.toStoreVCtrl, .toUserCenterVCtrl, .toNewPostVCtrl, .toSearchVCtrl, .toChatListAction, .toChatAction]//, [.setPrivacyPolicy, .setTermsAndConditions]
    ]
    let titles: [String] = ["DEFAULT", "TEXT FONTS AND COLORS", "ICONS", "COLORS", "REDIRECT", "TERMS AND PRIVACY POLICY"]
    
    var tapModel : TCustomSamplesModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Custom samples"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let model = tapModel {
            model.backAction()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSamplesCell", for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        cell.textLabel?.textColor = UIColor(red: 0, green: 1/255.0, blue: 2/255.0, alpha: 1)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 11)
        cell.detailTextLabel?.textColor = UIColor(red: 134/255.0, green: 135/255.0, blue: 136/255.0, alpha: 1)
        cell.detailTextLabel?.numberOfLines = 0
        let model = TCustomSamplesModel(type: datas[indexPath.section][indexPath.row])
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.describe
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = TCustomSamplesModel(type: datas[indexPath.section][indexPath.row])
        tapModel = model
        model.tapAction(nav: navigationController!)
    }
}
