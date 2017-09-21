//
//  History.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum History : String {
    case convict, wanted, none
    func description() -> String {
        switch self {
        case .convict:
            return "Used to be a convict."
        case .wanted:
            return "Used to be a professional thief."
        default:
            return String(self.rawValue).capitalized
        }
    }
}
