//
//  Color+Theme.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 8/22/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

extension Color {
    
    class func primaryColor() -> UIColor {
        return Color.blueGrey.darken1
    }
    
    class func primaryLightColor() -> UIColor {
        return Color.blueGrey.lighten2
    }
    
    class func primaryDarkColor() -> UIColor {
        return Color.blueGrey.darken4
    }
    
    class func primaryBackgroundColor() -> UIColor {
        return Color.blueGrey.lighten4
    }
    
    class func primaryLightBackgroundColor() -> UIColor {
        return Color.blueGrey.lighten5
    }
    
    class func secondaryColor() -> UIColor {
        return Color.blue.darken1
    }
    
    class func secondaryLightColor() -> UIColor {
        return Color.blue.lighten2
    }
    
    class func secondaryDarkColor() -> UIColor {
        return Color.blue.darken4
    }
    
    class func secondaryPulseColor() -> UIColor {
        return secondaryDarkColor()
    }
    
    class func disabledBackgroudColor(_ color: UIColor) -> UIColor {
        return color.withAlphaComponent(30/100)
    }
    
    class func disabledTextColor(_ color: UIColor) -> UIColor {
        return color.withAlphaComponent(60/100)
    }
    
    class func getTextColor(_ color: UIColor) -> UIColor {
        var textColor: UIColor = Color.darkText
        switch color {
            case primaryColor():
                textColor = Color.white
            case primaryLightColor():
                textColor = Color.black
            case primaryDarkColor():
                textColor = Color.white
            case secondaryColor():
                textColor = Color.white
            case secondaryLightColor():
                textColor = Color.black
            case secondaryDarkColor():
                textColor = Color.white
            default:
                textColor = Color.black
        }
        return textColor
    }
    
}
