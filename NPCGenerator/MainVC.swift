//
//  MainVC.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/14/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material
import MaterialComponents

class MainVC: UIViewController {
    
    @IBOutlet weak var buttonStackView: UIStackView!
    private var npcButton: MDCButton = MDCRaisedButton()
    private var groupButton: MDCButton = MDCRaisedButton()
    private var characterButton: MDCButton = MDCRaisedButton()
    private var _npcButtonAction: ((_ sender: UIButton) -> Void)? = nil
    private var _groupButtonAction: ((_ sender: UIButton) -> Void)? = nil
    private var _characterButtonAction: ((_ sender: UIButton) -> Void)? = nil

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.primaryBackgroundColor()
        
        navigationItem.setNavTitle("Main Menu")
        navigationItem.setNavDetails("Choose which NPC to Generate")
        
        setupButton(button: npcButton, title: "Generate NPC")
        setupButton(button: groupButton, title: "Generate Group")
        groupButton.isEnabled = false
        setupButton(button: characterButton, title: "Generate Character")
        _npcButtonAction = npcButtonAction
        _groupButtonAction = groupButtonAction
        _characterButtonAction = characterButtonAction
    }
    
    func setupButton(button: MDCButton, title: String) {
        button.setup()
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonStackView.addArrangedSubview(button)
    }

    func buttonAction(_ sender: RaisedButton) {
        if sender == npcButton, let action = _npcButtonAction {
            action(sender)
        } else if sender == groupButton, let action = _groupButtonAction {
            action(sender)
        } else if sender == characterButton, let action = _characterButtonAction {
            action(sender)
        }
    }
    
    func npcButtonAction(_ sender: UIButton) {
        print("Generate NPC pressed")
        let vc = SingleNPCGeneratorVC.makeFromStoryboard()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func groupButtonAction(_ sender: UIButton) {
        print("Generate Group pressed")
    }
    
    func characterButtonAction(_ sender: UIButton) {
        print("Generate Character pressed")
    }
    
}
