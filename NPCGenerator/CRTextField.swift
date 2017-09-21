//
//  CRTextField.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/31/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

enum FieldType: String {
    case none = ""
    case string
    case integer
    case bool
    case radio
    case multiple
}

class CRTextField : TextField {
    
    var parentVC: UIViewController? = nil
    var fieldType: FieldType = .none
    var multiChoiceControl: SelectView!
    var fieldData: FieldData!
    var selectedItems = [String]()
    
    func setup(fieldName: FieldName, delegate: UIViewController) {
        self.font = UIFont.systemFont(ofSize: 20.0)
        self.textColor = Color.primaryColor()
        self.dividerNormalColor = Color.primaryColor()
        self.placeholderNormalColor = Color.primaryColor()
        self.dividerActiveColor = Color.secondaryColor()
        self.placeholderActiveColor = Color.secondaryColor()
        self.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        self.setContentHuggingPriority(UILayoutPriority(1000), for: .vertical)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: 30.0)])
        let dummyView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 1, height: 1))
        self.inputView = dummyView;
        
        self.parentVC = delegate
        self.delegate = delegate
        self.fieldData = FieldData.init(forFieldName: fieldName)
        self.placeholder = fieldData.name
        if let defaultChoice = fieldData.choices.last {
            self.text = defaultChoice
            self.selectedItems.append(defaultChoice)
        }
        self.fieldType = fieldData.fieldType
        self.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    func buttonAction(_ textField: UITextField) {
        
        if let textField = textField as? CRTextField {
            switch textField.fieldType {
            case .multiple:
                print("multiple")
                openChooser(textField)
            case .radio:
                print("radio")
                openChooser(textField)
            default:
                print("other")
            }
        }
    }
    
    func openChooser(_ textField: CRTextField) {
        
        if textField.multiChoiceControl == nil {
            textField.multiChoiceControl = SelectView()
            textField.multiChoiceControl.title = (textField.placeholder != nil) ? "Choose \(textField.placeholder!)" : "Make Selection"
            textField.multiChoiceControl.delegate = textField
            textField.multiChoiceControl.allowsMultipleSelection = (textField.fieldType == .multiple)
        }
        textField.multiChoiceControl.show(completed: nil)
    }
}

extension CRTextField : SelectViewDelegate {
    
    func selectTableView(_ selectTableView: SelectTableView, titleForRowAtIndexPath indexPath: IndexPath) -> String? {
        return fieldData.choices[indexPath.row]
    }
    
    func selectTableView(_ selectTableView: SelectTableView, setSelectedForRowAtIndexPath indexPath: IndexPath) -> Bool {
        return selectedItems.contains(fieldData.choices[indexPath.row])
    }
    
    func selectView(_ selectView: SelectView, clickedButtonAtIndex buttonIndex: Int, withSelectedIndexPaths selectedIndexPaths: [IndexPath]?) {
        if buttonIndex == 1 {
            var items = [String]()
            if let indexPaths = selectedIndexPaths {
                for indexPath in indexPaths {
                    items.append(fieldData.choices[indexPath.row])
                }
            }
            if items.count > 0 {
                setButtonTitle(array: items)
                if let parentVC = parentVC as? SingleNPCGeneratorVC {
                    parentVC.formFieldWasFilled(forFieldName: self.fieldData.fieldName)
                }
            } else {
                setDefaultButtonTitle()
                if let vc = parentVC as? SingleNPCGeneratorVC {
                    vc.formFieldWasEmptied(forFieldName: self.fieldData.fieldName)
                }
            }
        }
    }
    
    func numberOfRows(in selectTableView: SelectTableView) -> Int {
        return fieldData.choices.count
    }
    
    private func setButtonTitle(array: [String]) {
        selectedItems = array
        self.text = array.joined(separator: ", ")
    }
    
    private func setDefaultButtonTitle() {
        selectedItems = [String]()
        self.text = "None Selected"
    }
    
    
}
