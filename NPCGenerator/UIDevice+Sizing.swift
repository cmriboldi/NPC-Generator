//
//  UIDevice+Sizing.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    struct SizeClassValues {
        var defaultValue: CGFloat
        var small: CGFloat
        var medium: CGFloat
        var large: CGFloat
    }
    
    class var horizontalSpacing: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 30, small: 25, medium: 27, large: 30))
    }
    
    class var verticalSpacing: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 20, small: 10, medium: 15, large: 20))
    }
    
    class var largeSpacing: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 30, small: 15, medium: 20, large: 30))
    }
    
    class var mediumSpacing: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 24, small: 10, medium: 17, large: 24))
    }
    
    class var largeMargin: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 40, small: 20, medium: 25, large: 40))
    }
    
    class var headerFontSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 36, small: 26, medium: 31, large: 36))
    }
    
    class var titleFontSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 20, small: 15, medium: 17, large: 20))
    }
    
    class var textFontSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 17, small: 15, medium: 16, large: 17))
    }
    
    class var subTitleFontSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 14, small: 12, medium: 13, large: 14))
    }
    
    class var buttonWidthSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 80, small: 70, medium: 75, large: 80))
    }
    
    class var buttonHeightSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 45, small: 25, medium: 35, large: 45))
    }
    
    class var anchorSize: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 16, small: 10, medium: 13, large: 16))
    }
    
    class var cellHeight: CGFloat {
        return getSizeClassValue(SizeClassValues(defaultValue: 45, small: 35, medium: 40, large: 45))
    }
    
    private class func getSizeClassValue(_ values: SizeClassValues) -> CGFloat{
        var value: CGFloat
        switch UIScreen.main.bounds.width {
        case 320.0:
            value = values.small
        case 375.0:
            value = values.medium
        case 414.0:
            value = values.large
        default:
            value = values.defaultValue
        }
        return value
    }
    
}
