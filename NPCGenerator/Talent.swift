//
//  Talent.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Talent : String {
    case paints, memory, playsIntrument, none
    func description() -> String {
        switch self {
        case .paints:
            return "Can recreate anything seen by painting."
        case .memory:
            return "Has perfect memory."
        case .playsIntrument:
            return "Plays an instrument."
        default:
            return String(self.rawValue).capitalized
        }
    }
}
