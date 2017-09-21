//
//  Gender.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Gender : String {
    case male, female, neither
    func description() -> String {
        return String(self.rawValue).capitalized
    }
}
