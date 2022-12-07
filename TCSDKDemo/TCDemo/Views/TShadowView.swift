//
//  TShadowView.swift
//  TCDemo
//
//  Created by hong on 2022/11/17.
//

import UIKit

class TShadowView: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViewStyle()
    }

    func setViewStyle() {
        layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 2, height: 6)
        layer.shadowRadius = 16
        layer.shadowOpacity = 1
        layer.cornerRadius = 8
    }
}
