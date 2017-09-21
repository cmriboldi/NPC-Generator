//
//  Mannerism.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Mannerism : String {
    case speaksLoudly, fidgets, tapsFingers, none
    func description() -> String {
        switch self {
        case .speaksLoudly:
            return "speaks loudly"
        case .fidgets:
            return "fidgets "
        case .tapsFingers:
            return "Plays an instrument."
        default:
            return String(self.rawValue).capitalized
        }
    }
}
