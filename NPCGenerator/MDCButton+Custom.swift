//
//  MDCButton+Custom.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/25/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material
import MaterialComponents


extension MDCButton {
    func setup() {
        self.setTitleColor(Color.getTextColor(Color.secondaryColor()), for: .normal)
        self.setBackgroundColor(Color.secondaryColor(), for: .normal)
        self.setTitleColor(Color.disabledTextColor(Color.getTextColor(Color.secondaryColor())), for: .disabled)
        self.setBackgroundColor(Color.disabledBackgroudColor(Color.secondaryColor()), for: .disabled)
        self.disabledAlpha = 0.6
        self.inkColor = Color.secondaryPulseColor()
    }
}
