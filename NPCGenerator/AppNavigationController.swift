//
//  AppNavigationController.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/29/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

class AppNavigationController: NavigationController {
    open override func prepare() {
        super.prepare()
        guard let v = navigationBar as? NavigationBar else {
            return
        }
        
        v.depthPreset = .none
        v.dividerColor = Color.grey.lighten3
        v.tintColor = Color.getTextColor(Color.primaryColor())
        v.barTintColor = Color.primaryColor()
        
    }
}

