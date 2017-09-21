//
//  SingleNPCGeneratorVC.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/19/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material
import MaterialComponents

class SingleNPCGeneratorVC : UIViewController {
    
    private var backButton: IconButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var raceTextField: CRTextField!
    @IBOutlet weak var genderTextField: CRTextField!
    @IBOutlet weak var alignmentTextField: CRTextField!
    @IBOutlet weak var occupationTextField: CRTextField!
    private let numberOfFields = 4
    private var generateButton: MDCButton = MDCRaisedButton()
    private var filledOutFields: Set = Set<FieldName>()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setNavTitle("Single NPC Generator")
        navigationItem.setNavDetails("Enter in details")
        
        navigationItem.backButton.image = Icon.cm.arrowBack
        navigationItem.backButton.tintColor = Color.getTextColor(Color.primaryColor())
        
        raceTextField.setup(fieldName: .race, delegate: self)
        genderTextField.setup(fieldName: .gender, delegate: self)
        alignmentTextField.setup(fieldName: .alignment, delegate: self)
        occupationTextField.setup(fieldName: .occupation, delegate: self)
        filledOutFields.insert(FieldName.race)
        filledOutFields.insert(FieldName.gender)
        filledOutFields.insert(FieldName.alignment)
        filledOutFields.insert(FieldName.occupation)
        
        generateButton.setup()
        generateButton.setTitle("Generate", for: .normal)
        setGenerateButtonEnabled()
        generateButton.addTarget(self, action: #selector(generateButtonClicked(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(generateButton)
        
    }
    
    func generateButtonClicked(_ button: UIButton) {
        print("generate pressed")
        let vc = DisplayNPCVC.makeFromStoryboard()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func formFieldWasFilled(forFieldName fieldType: FieldName) {
        filledOutFields.insert(fieldType)
        setGenerateButtonEnabled()
    }
    
    func formFieldWasEmptied(forFieldName fieldType: FieldName) {
        filledOutFields.remove(fieldType)
        setGenerateButtonEnabled()
    }
    
    func setGenerateButtonEnabled() {
        generateButton.isEnabled = (filledOutFields.count == numberOfFields) ? true : false
    }
    
    static func makeFromStoryboard() -> SingleNPCGeneratorVC {
        let storyboard = UIStoryboard(name: "SingleNPCGenerator", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SingleNPCGeneratorVC") as! SingleNPCGeneratorVC
    }
    
}
