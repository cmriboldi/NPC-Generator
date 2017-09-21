//
//  Bond.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Bond : String {
    case dedicated, protective, loyal, none
    func description() -> String {
        switch self {
        case .dedicated:
            return "Dedicated to fulfilling their life goal."
        case .protective:
            return "Protective of collegues and compatriots."
        case .loyal:
            return "Loyal to a benefactor, patron or employer."
        default:
            return String(self.rawValue).capitalized
        }
    }
}
