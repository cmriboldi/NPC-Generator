//
//  PopUpTitleView.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit

class PopUpTitleView: UIView {
    
    var label = UILabel()
    
    var title: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: UIDevice.titleFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(UIDevice.largeSpacing)-[label]-\(UIDevice.largeSpacing)-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["label": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(UIDevice.mediumSpacing)-[label]-\(UIDevice.mediumSpacing)-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["label": label]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
