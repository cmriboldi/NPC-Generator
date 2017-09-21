//
//  MultipleSelectTableView.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit

class SelectTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var selectTableViewDelegate: SelectTableViewDelegate?
    
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        delegate = self
        dataSource = self
        rowHeight = UITableViewAutomaticDimension
        estimatedRowHeight = 50
        separatorStyle = .none
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        alwaysBounceVertical = false
        register(SelectTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var stickToContentHeight = true
    
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: stickToContentHeight ? contentSize.height : 1000)
    }
    
    override func contentCompressionResistancePriority(for axis: UILayoutConstraintAxis) -> UILayoutPriority {
        if axis == .vertical {
            return UILayoutPriorityDefaultLow
        }
        return super.contentCompressionResistancePriority(for: axis)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectTableViewDelegate?.numberOfRows(in: self) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SelectTableViewCell ?? SelectTableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.configure(withLabel: selectTableViewDelegate?.selectTableView(self, titleForRowAtIndexPath: indexPath), selectType: allowsMultipleSelection ? .checkbox : .radio)
        
        if selectTableViewDelegate?.selectTableView(self, setSelectedForRowAtIndexPath: indexPath) ?? false {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTableViewDelegate?.selectTableView(self, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
}
