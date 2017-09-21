//
//  AbilityScore.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

class AbilityScore {
    
    enum AbilityName : String {
        case strength, dexterity, constitution, intelligence, wisdom, charisma
        func description() -> String {
            return String(self.rawValue).capitalized
        }
    }
    
    var name: AbilityName
    var score: Int
    var modifier: Int
    
    init(name: AbilityName) {
        self.name = name
        score = 10
        modifier = 0
    }
    
}
