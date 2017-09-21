//
//  PopUpBottomView.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

class PopUpButtonView: UIView {
    
    var cancelButton: FlatButton!
    var okButton: FlatButton!
    private var _cancelButtonAction: ((_ sender: UIButton) -> Void)? = nil
    private var _okButtonAction: ((_ sender: UIButton) -> Void)? = nil
    
    init(cancelButtonAction: @escaping (_ sender: UIButton) -> Void, okButtonAction: @escaping (_ sender: UIButton) -> Void) {
        super.init(frame: CGRect.zero)
        _cancelButtonAction = cancelButtonAction
        _okButtonAction = okButtonAction
        initiate()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initiate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initiate()
    }
    
    func initiate() {
        let buttonStackView = initiateButtonStackView()
        cancelButton = generateButton(withTitle: "CANCEL", withTag: 0)
        okButton = generateButton(withTitle: "OK", withTag: 1)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(okButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonStackView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[buttonStackView]-10-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["buttonStackView": buttonStackView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[buttonStackView]-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["buttonStackView": buttonStackView]))
    }
    
    private func initiateButtonStackView() -> UIStackView {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }
    
    private func generateButton(withTitle title: String, withTag tag: Int) -> FlatButton {
        let button = FlatButton(title: title, titleColor: UIColor.black)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        button.tag = tag
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: UIDevice.buttonHeightSize))
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: UIDevice.buttonWidthSize))
        return button
    }
    
    func buttonAction(_ sender: FlatButton) {
        if sender == cancelButton, let action = _cancelButtonAction {
            action(sender)
        } else if sender == okButton, let action = _okButtonAction {
            action(sender)
        }
    }
    
}
