//
//  FieldData.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

enum FieldName {
    case race
    case gender
    case alignment
    case occupation
    case none
}

class FieldData : NSObject {
    
    var fieldName: FieldName
    
    override init() {
        fieldName = .none
        super.init()
    }
    
    convenience init(forFieldName fieldName: FieldName) {
        self.init()
        self.fieldName = fieldName
        
    }
    
    var choices: [String] {
        get {
            var choices = [String]()
            switch fieldName {
                case .race:
                    choices = []
                    for race in iterateEnum(Race.self) {
                        choices.append(race.name())
                    }
                case .gender:
                    choices = ["Male", "Female", "Random", "Neither"]
                case .alignment:
                    choices = []
                    for alignment in iterateEnum(Alignment.self) {
                        choices.append(alignment.name())
                    }
                    choices.append("Random")
                case .occupation:
                    choices = ["Class", "Profession", "Random"]
                default: break
                }
            return choices
        }
    }
    
    var name: String {
        get {
            var name = ""
            switch fieldName {
                case .race:
                    name = "Race"
                case .gender:
                    name = "Gender"
                case .alignment:
                    name = "Alignment"
                case .occupation:
                    name = "Occupation"
                default: break
            }
            return name
        }
    }
    
    var fieldType: FieldType {
        get {
            var fieldType = FieldType.none
            switch fieldName {
                case .race:
                    fieldType = .multiple
                case .gender:
                    fieldType = .radio
                case .alignment:
                    fieldType = .radio
                case .occupation:
                    fieldType = .radio
                default: break
            }
            return fieldType
        }
    }
    
}
