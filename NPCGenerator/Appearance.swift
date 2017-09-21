//
//  Appearance.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Appearance : String {
    case piercings, missingTeeth, bald, none
    func description() -> String {
        switch self {
        case .piercings:
            return "Has multiple piercings on the face"
        case .missingTeeth:
            return "Is missing multiple teeth."
        default:
            return String(self.rawValue).capitalized
        }
    }
}
