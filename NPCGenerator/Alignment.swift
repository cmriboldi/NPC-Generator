//
//  Alignment.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Alignment : String {
    case lawfulGood, neutralGood, chaoticGood
    case lawfulNeutral, neutral, chaoticNeutral
    case lawfulEvil, neutralEvil, chaoticEvil
    case none
    func name() -> String {
        switch self {
        case .lawfulGood:
            return "Lawful Good"
        case .neutralGood:
            return "Neutral Good"
        case .chaoticGood:
            return "Chaotic Good"
        case .lawfulNeutral:
            return "Lawful Neutral"
        case .chaoticNeutral:
            return "Chaotic Neutral"
        case .lawfulEvil:
            return "Lawful Evil"
        case .neutralEvil:
            return "Neutral Evil"
        case .chaoticEvil:
            return "Chaotic Evil"
        default:
            return String(self.rawValue).capitalized
        }
    }
}
