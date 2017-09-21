//
//  SelectTableViewDelegate.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

protocol SelectTableViewDelegate {
    func selectTableView(_ selectTableView: SelectTableView, titleForRowAtIndexPath indexPath: IndexPath) -> String?
    func selectTableView(_ selectTableView: SelectTableView, setSelectedForRowAtIndexPath indexPath: IndexPath) -> Bool
    func selectTableView(_ selectTableView: SelectTableView, didSelectRowAt indexPath: IndexPath)
    func numberOfRows(in selectTableView: SelectTableView) -> Int
}

extension SelectTableViewDelegate {
    func selectTableView(_ selectTableView: SelectTableView, titleForRowAtIndexPath indexPath: IndexPath) -> String? {
        return nil
    }
    
    func selectTableView(_ selectTableView: SelectTableView, setSelectedForRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    func selectTableView(_ selectTableView: SelectTableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfRows(in selectTableView: SelectTableView) -> Int {
        return 0
    }
}

protocol SelectTableViewModel {
    var label: String? { get }
    var isSelected: Bool { get }
}

class SelectTableViewDelegateWrapper: SelectTableViewDelegate {
    var dataSource: [SelectTableViewModel]?
    var selectedRowAtIndex: ((_ model: SelectTableViewModel?) -> ())?
    
    func selectTableView(_ selectTableView: SelectTableView, titleForRowAtIndexPath indexPath: IndexPath) -> String? {
        return dataSource?[indexPath.row].label
    }
    
    func selectTableView(_ selectTableView: SelectTableView, setSelectedForRowAtIndexPath indexPath: IndexPath) -> Bool {
        return dataSource?[indexPath.row].isSelected ?? false
    }
    
    func selectTableView(_ selectTableView: SelectTableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowAtIndex?(dataSource?[indexPath.row])
    }
    
    func numberOfRows(in selectTableView: SelectTableView) -> Int {
        return dataSource?.count ?? 0
    }
}
