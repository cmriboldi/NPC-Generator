//
//  MultipleSelectView.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

protocol SelectViewDelegate: SelectTableViewDelegate {
    func selectView(_ selectView: SelectView, clickedButtonAtIndex buttonIndex: Int, withSelectedIndexPaths selectedIndexPaths: [IndexPath]?)
}

class SelectView: NSObject {
    
    private let _tableView = SelectTableView()
    private let _popUp = PopUpView()
    private let _popUpTitleView = PopUpTitleView()
    
    var title: String? {
        get {
            return _popUpTitleView.title
        }
        set {
            _popUpTitleView.title = newValue
        }
    }
    
    var allowsMultipleSelection: Bool {
        get { return _tableView.allowsMultipleSelection }
        set { _tableView.allowsMultipleSelection = newValue }
    }
    
    var delegate: SelectViewDelegate? {
        didSet { _tableView.selectTableViewDelegate = delegate }
    }
    
    override init() {
        super.init()
        initiate()
    }
    
    func initiate() {
        _popUp.addSubview(_popUpTitleView)
        
        let tableContainerView = UIView()
        tableContainerView.backgroundColor = UIColor.clear
        tableContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        tableContainerView.addSubview(_tableView)
        NSLayoutConstraint.activate([
            _tableView.topAnchor.constraint(equalTo: tableContainerView.topAnchor),
            _tableView.bottomAnchor.constraint(equalTo: tableContainerView.bottomAnchor),
            _tableView.leadingAnchor.constraint(equalTo: tableContainerView.leadingAnchor, constant: 30.0),
            _tableView.trailingAnchor.constraint(equalTo: tableContainerView.trailingAnchor, constant: -30.0)
            ])
        
        _popUp.addSubview(tableContainerView)
        
        let buttonView = PopUpButtonView(cancelButtonAction: { (button) in
            self.buttonAction(button)
        }, okButtonAction: { (button) in
            self.buttonAction(button)
        })
        _popUp.addSubview(buttonView)
    }
    
    func show(completed: PopUpView.Action?) {
        _popUp.show {
            completed?()
            self._tableView.flashScrollIndicators()
        }
    }
    
    func buttonAction(_ sender: UIButton) {
        _popUp.hide {
            self.delegate?.selectView(self, clickedButtonAtIndex: sender.tag, withSelectedIndexPaths: self._tableView.indexPathsForSelectedRows)
        }
    }
}
