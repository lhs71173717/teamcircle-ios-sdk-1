//
//  TCustomSamplesModel.swift
//  TCDemo
//
//  Created by hong on 2022/11/19.
//

import UIKit
import TeamCircleSDK

class TCustomSamplesModel: NSObject {
    let type : TCustomSamplesType
    let name : String
    let describe : String
    
    init(type: TCustomSamplesType) {
        self.type = type
        switch type {
        case .normal:
            name = "Default"
            describe = "Default"
        case .setTextFontRegular:
            name = "setTextFontRegular"
            describe = "TCManager.sharedInstance.setTextFontRegular(text: _,color:_)"
        case .setTextFontBold:
            name = "setTextFontBold"
            describe = "TCManager.sharedInstance.setTextFontBold(text: _,color:_)"
        case .setTextFontAction:
            name = "setTextFontAction"
            describe = "TCManager.sharedInstance.setTextFontAction(text: _,color:_)"
        case .setTextFontProductName:
            name = "setTextFontProductName"
            describe = "TCManager.sharedInstance.setTextFontProductName(text: _,color:_)"
        case .setTextFontProductPrice:
            name = "setTextFontProductPrice"
            describe = "TCManager.sharedInstance.setTextFontProductPrice(text: _,color:_)"
        case .setProductDescColor:
            name = "setProductDescColor"
            describe = "TCManager.sharedInstance.setProductDescColor(text: _,color:_)"
        
        case .setIconFavorite:
            name = "setIconFavorite"
            describe = "TCManager.sharedInstance.setIconFavorite(icon:_)"
        case .setIconFavoriteSelected:
            name = "setIconFavoriteSelected"
            describe = "TCManager.sharedInstance.setIconFavoriteSelected(icon:_)"
        case .setIconTag:
            name = "setIconTag"
            describe = "TCManager.sharedInstance.setIconTag(icon:_)"
        case .setIconTagSelected:
            name = "setIconTagSelected"
            describe = "TCManager.sharedInstance.setIconTagSelected(icon:_)"
        case .setIconLike:
            name = "setIconLike"
            describe = "TCManager.sharedInstance.setIconLike(icon:_)"
        case .setIconLikeSelected:
            name = "setIconLikeSelected"
            describe = "TCManager.sharedInstance.setIconLikeSelected(icon:_)"
        case .setIconShare:
            name = "setIconShare"
            describe = "TCManager.sharedInstance.setIconShare(icon:_)"
        case .setIconComment:
            name = "setIconComment"
            describe = "TCManager.sharedInstance.setIconComment(icon:_)"
        case .setIconNewPost:
            name = "setIconNewPost"
            describe = "TCManager.sharedInstance.setIconNewPost(icon:_)"
        case .setIconBack:
            name = "setIconBack"
            describe = "TCManager.sharedInstance.setIconBack(icon:_)"
            
        case .setSystemBackgroundColor:
            name = "setSystemBackgroundColor"
            describe = "TCManager.sharedInstance.setSystemBackgroundColor(color:_)"
        case .setBackgroundEffectColor:
            name = "setBackgroundEffectColor"
            describe = "TCManager.sharedInstance.setBackgroundEffectColor(color:_)"
        case .setLinkColor:
            name = "setLinkColor"
            describe = "TCManager.sharedInstance.setLinkColor(color:_)"
        
        case .toStoreVCtrl:
            name = "toStoreVCtrl"
            describe = "TCManager.sharedInstance.toStoreVCtrl(nav:_, complete:_)"
        case .toUserCenterVCtrl:
            name = "toUserCenterVCtrl"
            describe = "TCManager.sharedInstance.toUserCenterVCtrl(nav:_, complete:_)"
        case .toNewPostVCtrl:
            name = "toNewPostVCtrl"
            describe = "TCManager.sharedInstance.toNewPostVCtrl(complete:_)"
        case .toSearchVCtrl:
            name = "toSearchVCtrl"
            describe = "TCManager.sharedInstance.toSearchVCtrl(complete:_)"
        case .toChatListAction:
            name = "toChatListAction"
            describe = "TCManager.sharedInstance.toChatListAction(nav:_)"
        case .toChatAction:
            name = "toChatAction"
            describe = "TCManager.sharedInstance.toChatAction(nav:_, conversationId:_)"
        
        case .setPrivacyPolicy:
            name = "setPrivacyPolicy"
            describe = "TCManager.sharedInstance.setPrivacyPolicy(url:_)"
        case .setTermsAndConditions:
            name = "setTermsAndConditions"
            describe = "TCManager.sharedInstance.setTermsAndConditions(url:_)"
        }
    }
    
    func tapAction(nav: UINavigationController) {
        switch type {
        case .normal:
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setTextFontRegular:
            TCManager.sharedInstance.setTextFontRegular(font: UIFont.systemFont(ofSize: 16), color: .red)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setTextFontBold:
            TCManager.sharedInstance.setTextFontBold(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: .red)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setTextFontAction:
            TCManager.sharedInstance.setTextFontAction(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: .red)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setTextFontProductName:
            TCManager.sharedInstance.setTextFontProductName(font: UIFont.systemFont(ofSize: 16), color: .red)
            TCManager.sharedInstance.toStoreVCtrl(nav: nav) { vc, error in
                
            }
        case .setTextFontProductPrice:
            TCManager.sharedInstance.setTextFontProductPrice(font: UIFont.systemFont(ofSize: 16), color: .red)
            TCManager.sharedInstance.toStoreVCtrl(nav: nav) { vc, error in
                
            }
        case .setProductDescColor:
            TCManager.sharedInstance.setProductDescColor(color: .red)
            TCManager.sharedInstance.toStoreVCtrl(nav: nav) { vc, error in
                
            }
        
        case .setIconFavorite:
            TCManager.sharedInstance.setIconFavorite(icon: UIImage(named: "favorite")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconFavoriteSelected:
            TCManager.sharedInstance.setIconFavoriteSelected(icon: UIImage(named: "favoriteselected")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconTag:
            TCManager.sharedInstance.setIconTag(icon: UIImage(named: "tag")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconTagSelected:
            TCManager.sharedInstance.setIconTagSelected(icon: UIImage(named: "tagselected")!)
            TCManager.sharedInstance.toNewPostVCtrl { error in
                
            }
        case .setIconLike:
            TCManager.sharedInstance.setIconLike(icon: UIImage(named: "like")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconLikeSelected:
            TCManager.sharedInstance.setIconLikeSelected(icon: UIImage(named: "likeselected")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconShare:
            TCManager.sharedInstance.setIconShare(icon: UIImage(named: "share")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconComment:
            TCManager.sharedInstance.setIconComment(icon: UIImage(named: "comment")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconNewPost:
            TCManager.sharedInstance.setIconNewPost(icon: UIImage(named: "newpost")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setIconBack:
            TCManager.sharedInstance.setIconBack(icon: UIImage(named: "back2")!)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
            
        case .setSystemBackgroundColor:
            TCManager.sharedInstance.setSystemBackgroundColor(color: .red)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setBackgroundEffectColor:
            TCManager.sharedInstance.setBackgroundEffectColor(color: .red)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        case .setLinkColor:
            TCManager.sharedInstance.setLinkColor(color: .red)
            nav.pushViewController(TCCircleHomeVCtrl(), animated: true)
        
        case .toStoreVCtrl:
            TCManager.sharedInstance.toStoreVCtrl(nav: nav) { vc, error in
                
            }
        case .toUserCenterVCtrl:
            TCManager.sharedInstance.toUserCenterVCtrl(nav: nav) { vc, error in
                
            }
        case .toNewPostVCtrl:
            TCManager.sharedInstance.toNewPostVCtrl { error in
                
            }
        case .toSearchVCtrl:
            TCManager.sharedInstance.toSearchVCtrl { error in
                
            }
        case .toChatListAction:
            TCManager.sharedInstance.toChatListAction(nav: nav)
        case .toChatAction:
//            TCManager.sharedInstance.toChatAction(nav: nav, conversationId: "")
            break
        //Enter the User Center, click More in the upper right corner, and click Settings
        case .setPrivacyPolicy:
            TCManager.sharedInstance.setPrivacyPolicy(url: "")
            TCManager.sharedInstance.toUserCenterVCtrl(nav: nav) { vc, error in
                
            }
        case .setTermsAndConditions:
            TCManager.sharedInstance.setTermsAndConditions(url: "")
            TCManager.sharedInstance.toUserCenterVCtrl(nav: nav) { vc, error in
                
            }
        }
    }
    
    func backAction() {
        switch type {
        case .setTextFontRegular:
            TCManager.sharedInstance.setTextFontRegular(font: UIFont.systemFont(ofSize: 14), color: .black)
        case .setTextFontBold:
            TCManager.sharedInstance.setTextFontBold(font: UIFont.systemFont(ofSize: 14, weight: .medium), color: .black)
        case .setTextFontAction:
            TCManager.sharedInstance.setTextFontAction(font: UIFont.systemFont(ofSize: 14), color: .black)
        case .setTextFontProductName:
            TCManager.sharedInstance.setTextFontProductName(font: UIFont.systemFont(ofSize: 16), color: .black)
        case .setTextFontProductPrice:
            TCManager.sharedInstance.setTextFontProductPrice(font: UIFont.boldSystemFont(ofSize: 20), color: .white)
        case .setProductDescColor:
            TCManager.sharedInstance.setProductDescColor(color: UIColor.init(hex6: 0x868788))
        
        case .setIconFavorite:
            TCManager.sharedInstance.setIconFavorite(icon: UIImage(named: "post_favor_light")!)
        case .setIconFavoriteSelected:
            TCManager.sharedInstance.setIconFavoriteSelected(icon: UIImage(named: "post_favor-sel")!)
        case .setIconTag:
            TCManager.sharedInstance.setIconTag(icon: UIImage(named: "Product_Tag_light")!)
        case .setIconTagSelected:
            TCManager.sharedInstance.setIconTagSelected(icon: UIImage(named: "product_selected_light")!)
        case .setIconLike:
            TCManager.sharedInstance.setIconLike(icon: UIImage(named: "favorite")!)
        case .setIconLikeSelected:
            TCManager.sharedInstance.setIconLikeSelected(icon: UIImage(named: "favoriteselected")!)
        case .setIconShare:
            TCManager.sharedInstance.setIconShare(icon: UIImage(named: "share_light")!)
        case .setIconComment:
            TCManager.sharedInstance.setIconComment(icon: UIImage(named: "post_comment_light")!)
        case .setIconNewPost:
            TCManager.sharedInstance.setIconNewPost(icon: UIImage(named: "newPost_light")!)
        case .setIconBack:
            TCManager.sharedInstance.setIconBack(icon: UIImage(named: "back")!)
            
        case .setSystemBackgroundColor:
            TCManager.sharedInstance.setSystemBackgroundColor(color: .white)
        case .setBackgroundEffectColor:
            TCManager.sharedInstance.setBackgroundEffectColor(color: UIColor.init(hex6: 0xF6F8FA))
        case .setLinkColor:
            TCManager.sharedInstance.setBackgroundEffectColor(color: UIColor.init(hex6: 0x1B99F5))
        default:
            break
        }
    }
}
