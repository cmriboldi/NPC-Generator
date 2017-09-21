//
//  SelectTableViewCell.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

class SelectTableViewCell: UITableViewCell {
    var selectedImageView: UIImageView?
    var itemLabel: UILabel?
    var selectType: SelectType = .checkbox
    
    enum SelectType {
        case checkbox
        case radio
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedImageView?.image = getSelectedImage(selected: selected)
    }
    
    func configure(withLabel label: String?, selectType: SelectType) {
        initiateIfNeeded()
        itemLabel?.text = label
        self.selectType = selectType
    }
    
    private func initiateIfNeeded() {
        if selectedImageView != nil && itemLabel != nil {
            return
        }
        
        selectionStyle = .none
        
        selectedImageView = UIImageView()
        itemLabel = UILabel()
        
        guard let selectedImageView = selectedImageView, let itemLabel = itemLabel else {
            return
        }
        
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        selectedImageView.image = #imageLiteral(resourceName: "ic_check_box_outline_blank")
        selectedImageView.tintColor = Color.primaryColor()
        selectedImageView.contentMode = .scaleAspectFit
        contentView.addSubview(selectedImageView)
        
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.lineBreakMode = .byWordWrapping
        itemLabel.numberOfLines = 0
        itemLabel.textColor = Color.primaryColor()
        contentView.addSubview(itemLabel)
        
        let views: [String: Any] = ["selectedImageView": selectedImageView, "itemLabel": itemLabel]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[selectedImageView]-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[itemLabel]-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[selectedImageView(20)]-16-[itemLabel]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
    }
    
    private func getSelectedImage(selected: Bool) -> UIImage {
        switch selectType {
        case .checkbox:
            return selected ? #imageLiteral(resourceName: "ic_check_box") : #imageLiteral(resourceName: "ic_check_box_outline_blank")
        case .radio:
            return selected ? #imageLiteral(resourceName: "ic_radio_button_checked") : #imageLiteral(resourceName: "ic_radio_button_unchecked")
        }
    }
    
}
