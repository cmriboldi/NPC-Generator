//
//  Flaw.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Flaw : String {
    case love, arrogance, phobia, none
    func description() -> String {
        switch self {
        case .love:
            return "Has a forbidden love."
        case .arrogance:
            return "Arrogance."
        case .phobia:
            return "Has a specific phobia."
        default:
            return String(self.rawValue).capitalized
        }
    }
}
