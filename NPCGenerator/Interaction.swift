//
//  Interaction.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Interaction : String {
    case arrogant, rude, curious, none
    func description() -> String {
        switch self {
//        case .some-interaction:
//            return "complex interaction description"
        default:
            return String(self.rawValue).capitalized
        }
    }
}
