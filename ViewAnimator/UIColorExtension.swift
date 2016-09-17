//
//  UIColorExtension.swift
//  RSBarcodesSample
//
//  Created by R0CKSTAR on 6/13/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

import UIKit

extension UIColor {
	
    convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let index   = rgba.startIndex.advancedBy(1)
            let hex     = rgba.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                switch (hex.characters.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
                }
            } else {
                print("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix", terminator: "")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
//    convenience init(coreValueName: String) {
//        var color: String
//        switch (coreValueName) {
//            case Constants.AX:
//                color = "#614c97"
//            case Constants.CI:
//                color = "#223c90"
//            case Constants.HF:
//                color = "#f5b60d"
//            case Constants.TB:
//                color = "#de2d61"
//            case Constants.TP:
//                color = "#008d80"
//            case Constants.AE:
//                color = "#6cb143"
//            default:
//                color = "#00bcd4"
//        }
//        self.init(rgba: color);
//    
//    }
    
    class func clearGrayColor() -> UIColor {
        return UIColor(rgba: "#E5E5E5")
    }
    
    class func cyanStarMeUpColor() -> UIColor {
        return UIColor(rgba: "#00BCD4")
    }
    
    class func blueStarMeUpColor() -> UIColor {
        return UIColor(rgba: "#0E5A69")
    }
    class func clearSilverColor() -> UIColor {
        return UIColor(colorLiteralRed: 204/255, green: 215/255, blue: 223/255, alpha: 0.4)
    }

    
    class func lighterColorForColor(color: UIColor) -> UIColor {

        var rgba = [CGFloat](count: 4, repeatedValue: 0.0)
        color.getRed(&rgba[0], green: &rgba[1], blue: &rgba[2], alpha: &rgba[3])
        
        return UIColor(red: min(rgba[0] + 0.2, 1.0), green: min(rgba[1] + 0.2, 1.0), blue: min(rgba[2] + 0.2, 1.0), alpha: rgba[3])
    }
    
    class func darkerColorForColor(color: UIColor) -> UIColor {
        
        var rgba = [CGFloat](count: 4, repeatedValue: 0.0)
        color.getRed(&rgba[0], green: &rgba[1], blue: &rgba[2], alpha: &rgba[3])
        
        return UIColor(red: max(rgba[0] - 0.2, 0.0), green: max(rgba[1] - 0.2, 0.0), blue: max(rgba[2] - 0.2, 0.0), alpha: rgba[3])
    }
    func darkerColor() -> UIColor {
        return UIColor.darkerColorForColor(self)
    }
}
