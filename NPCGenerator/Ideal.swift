//
//  Ideal.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Ideal : String {
    case charity, community, balance, none
    func description() -> String {
        switch self {
//        case .complex-ideal:
//            return "comples ideal description"
        default:
            return String(self.rawValue).capitalized
        }
    }
}
