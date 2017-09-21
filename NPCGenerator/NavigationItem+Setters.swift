//
//  NavigationItem+Setters.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/30/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

extension UINavigationItem {
    func setNavTitle(_ text: String) {
        self.titleLabel.text = text
        self.titleLabel.textColor = Color.getTextColor(Color.primaryColor())
    }
    
    func setNavDetails(_ text: String) {
        self.detailLabel.text = text
        self.detailLabel.textColor = Color.getTextColor(Color.primaryColor())
    }
}


