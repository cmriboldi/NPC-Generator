//
//  Occupation.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Occupation : String {
    case hunter, pirate, juggler, landlord
    func title() -> String {
        switch self {
//        case .someOccupation:
//            return "some complex titel"
        default:
            return String(self.rawValue).capitalized
        }
    }
}
