//
//  Race.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/14/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum Race : String {
    
    case dwarf, elf, halfElf, human //For now I'm commenting out all the other options in orderto simplify the programming.
    
//    case aasimar, dragonborn, dwarf, elf, firbolg, genasi, gnome, goblin, goliath, halfling, halfElf
//    case halfOrc, hobgoblin, human, kenku, kobold, lizardfolk, orc, tabaxi, tiefling, triton, yuanTi
    func name() -> String {
        switch self {
        case .halfElf:
            return "Half-Elf"
//        case .halfOrc:
//            return "Half-Orc"
//        case .yuanTi:
//            return "Yuan-Ti Pureblood"
        default:
            return String(self.rawValue).capitalized
        }
    }
    enum Subrace : String {
//        //Aasimar
//        case protector, scourge, fallen
        //Dwarf
        case hill, mountain, duergar
        //Elf
        case high, wood, drow
//        //Gensai
//        case air, earth, fire, water
//        //Gnome
//        case forest, rock, deep
//        //Halfling
//        case lightfoot, stout, ghostwise
//        //Half-Elf
//        case halfWood, halfMoon, halfSun, halfDrow, halfAquatic
//        //Tiefling
//        case variant, feral
        //Other
        case none
    }
}
