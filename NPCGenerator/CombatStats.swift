//
//  CombatStats.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/16/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

class CombatStats {
    
    var strength: AbilityScore
    var dexterity: AbilityScore
    var constitution: AbilityScore
    var intelligence: AbilityScore
    var wisdom: AbilityScore
    var charisma: AbilityScore
    
    init() {
        strength = AbilityScore.init(name: AbilityScore.AbilityName.strength)
        dexterity = AbilityScore.init(name: AbilityScore.AbilityName.dexterity)
        constitution = AbilityScore.init(name: AbilityScore.AbilityName.constitution)
        intelligence = AbilityScore.init(name: AbilityScore.AbilityName.intelligence)
        wisdom = AbilityScore.init(name: AbilityScore.AbilityName.wisdom)
        charisma = AbilityScore.init(name: AbilityScore.AbilityName.charisma)
    }
    
    func getHighAbility() -> AbilityScore{
        return strength
    }
    
    func getLowAbility() -> AbilityScore{
        return dexterity
    }
}
