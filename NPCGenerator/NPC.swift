//
//  NPC.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/14/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

class NPC : NSObject {
    
    var name: String
    var title: String
    var age: Int
    var height: String
    var weight: String
    var race: Race
    var gender: Gender
    var alignment: Alignment
    var occupation: Occupation
    var history: History
    var appearance: Appearance
    var talent: Talent
    var mannerism: Mannerism
    var interaction: Interaction
    var ideal: Ideal
    var bond: Bond
    var flaw: Flaw
    var stats: CombatStats
    
    override init() {
        name = "Aaragorn"
        title = "Dunadain"
        age = 35
        height = "6'4\""
        weight = "230 lbs"
        race = Race.human
        gender = Gender.male
        alignment = Alignment.lawfulGood
        occupation = Occupation.hunter
        history = History.wanted
        appearance = Appearance.missingTeeth
        talent = Talent.memory
        mannerism = Mannerism.speaksLoudly
        interaction = Interaction.arrogant
        ideal = Ideal.charity
        bond = Bond.loyal
        flaw = Flaw.love
        stats = CombatStats()
    }
  
}
