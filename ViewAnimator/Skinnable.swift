//
//  SkinnableProtocol.swift
//  StarMeUp
//
//  Created by Javier Loucim on 6/10/16.
//  Copyright © 2016 Globant. All rights reserved.
//

import Foundation
import UIKit


struct Skin {
    var primaryColor:String
    var darkPrimaryColor:String
    var lightPrimaryColor:String
    var textColor:String
    var accentColor:String
    var primaryText:String
    var secondaryText:String
    var dividerColor:String
    var name:String
    var podiumColor1:String
    var podiumColor2:String
    var podiumColor3:String
    var backgroundColor:String
}

class SkinData {
    static var sharedInstance = SkinData()
    
    var currentSkin: Skin = Skin(primaryColor: "#1976D2",
         darkPrimaryColor: "#0976D2",
         lightPrimaryColor: "#DEEEEE",
         textColor: "#FFFFFF",
         accentColor: "#CDDC39",
         primaryText: "##666666",
         secondaryText: "#666666",
         dividerColor: "#cccccc",
         name: "LastLenias",
         podiumColor1: "#999999", podiumColor2: "#9B26AF", podiumColor3: "#72B508", backgroundColor: "#F4F4F4"
    )

    var titleFont: UIFont?
    var normalFont: UIFont?
    var tinyFont: UIFont?
    var smallFont: UIFont?
    var isDefaultSkin:Bool = true
    var availableSkins = Array<Skin>()
    var boldFont: UIFont?
    
    var busNames = ["Magenta", "Cyan", "Green", "Black", "White", "Rouge"]
    var busColors = ["#C605CC", "#00D8D2", "#D9E021", "#000000","#CCCCCC", "#ED1C24"]
    
    func dumpFonts() {
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName)
            print("Font Names = [\(names)]")
        }
        
    }
    init() {
        let fontName1 = "SFUIDisplay-Regular"
        let fontName2 = "SFUIDisplay-Medium"
        
//        dumpFonts()
        
        normalFont = UIFont(name: fontName1, size: 12)!
        tinyFont = UIFont(name: fontName1, size: 9)!
        titleFont = UIFont(name: fontName2, size: 16)!
        smallFont = UIFont(name: fontName1, size: 10)!
        boldFont = UIFont(name: fontName2, size: 12)!
        
        availableSkins.append(self.currentSkin)
        availableSkins.append(Skin(primaryColor: "#D40000",
             darkPrimaryColor: "#C40000",
             lightPrimaryColor: "#FFEAED",
             textColor: "#666666",
             accentColor: "#B9CF00",
             primaryText: "#FFFFFF",
             secondaryText: "#666666",
             dividerColor: "#B6B6B6",
             name: "Cherry",
             podiumColor1: "#999999", podiumColor2: "#FF9700", podiumColor3: "#9B26AF", backgroundColor: "#F4F4F4"
        ))
        availableSkins.append(Skin(primaryColor: "#9B26AF",
            darkPrimaryColor: "#691A99",
            lightPrimaryColor: "#F2E4F4",
            textColor: "#666666",
            accentColor: "#B9CF00",
            primaryText: "#FFFFFF",
            secondaryText: "#727272",
            dividerColor: "#B6B6B6",
            name: "Amethyst",
            podiumColor1: "#9B26AF", podiumColor2: "#D40000", podiumColor3: "#00AAAC", backgroundColor: "#EDEDED"
            )
        )
        availableSkins.append(Skin(primaryColor: "#2095F2",
            darkPrimaryColor: "#1464BF",
            lightPrimaryColor: "#E2F1FC",
            textColor: "#666666",
            accentColor: "#B9CF00",
            primaryText: "#FFFFFF",
            secondaryText: "#727272",
            dividerColor: "#B6B6B6",
            name: "Sky",
            podiumColor1: "#2095F2", podiumColor2: "#9B26AF", podiumColor3: "#80CB15", backgroundColor: "#EDEDED"
            )
        )
        availableSkins.append(Skin(primaryColor: "#00AAAC",
            darkPrimaryColor: "#008884",
            lightPrimaryColor: "#DEEEEE",
            textColor: "#666666",
            accentColor: "#B9CF00",
            primaryText: "#FFFFFF",
            secondaryText: "#727272",
            dividerColor: "#B6B6B6",
            name: "Teal",
            podiumColor1: "#00AAAC", podiumColor2: "#9B26AF", podiumColor3: "#80CB15", backgroundColor: "#EDEDED"
            )
        )
        availableSkins.append(Skin(primaryColor: "#72B508",
            darkPrimaryColor: "#668C07",
            lightPrimaryColor: "#E8EDDF",
            textColor: "#666666",
            accentColor: "#B9CF00",
            primaryText: "#FFFFFF",
            secondaryText: "#727272",
            dividerColor: "#B6B6B6",
            name: "Nature",
            podiumColor1: "#80CB15", podiumColor2: "#00AAAC", podiumColor3: "#FF9700", backgroundColor: "#EDEDED"
            )
        )
        availableSkins.append(Skin(primaryColor: "#FF9700",
            darkPrimaryColor: "#EE6B00",
            lightPrimaryColor: "#FFF2DF",
            textColor: "#666666",
            accentColor: "#B9CF00",
            primaryText: "#FFFFFF",
            secondaryText: "#727272",
            dividerColor: "#B6B6B6",
            name: "Citrus",
            podiumColor1: "#FF9700", podiumColor2: "#80CB15", podiumColor3: "#D40000", backgroundColor: "#EDEDED"
            )
        )

        
    }


}
protocol Skinnable {
}

extension Skinnable {
    
    
    func skinPrimaryColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.primaryColor)
    }
    
    func skinDarkPrimaryColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.darkPrimaryColor)
    }
    
    func skinLightPrimaryColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.lightPrimaryColor)
    }
    func skinTextColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.textColor)
    }

    func skinAccentColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.accentColor)
    }

    func skinPrimaryTextColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.primaryText)
    }
    
    func skinSecondaryTextColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.secondaryText)
    }
    
    func skinDividerColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.dividerColor)
    }
    func skinFirstPodiumColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.podiumColor1)
    }
    func skinSecondPodiumColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.podiumColor2)
    }
    func skinThirdPodiumColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.podiumColor3)
    }
    func skinBackgroundColor() -> UIColor {
        return UIColor(rgba: SkinData.sharedInstance.currentSkin.backgroundColor)
    }
    
    func skinApp() {
        UINavigationBar.appearance().backgroundColor = skinPrimaryColor()
        UINavigationBar.appearance().barTintColor = skinPrimaryColor()
        UINavigationBar.appearance().tintColor = skinTextColor()
 
        UINavigationBar.appearance().translucent = true

        let attributes = [NSForegroundColorAttributeName: skinTextColor(),
                          NSFontAttributeName: SkinData.sharedInstance.titleFont!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = skinTextColor()
    }
    
//    func tintImage(image:UIImage) -> UIImage {
//        return tintImageWithColor(image, color: skinPrimaryColor())
//    }
    
//    func tintImageWithColor(image:UIImage, color:UIColor) -> UIImage {
//        
//        return tintImageWithColor(image, color: color, mode: UIImageRenderingMode.AlwaysTemplate)
//    }
//    func tintImageWithColor(image:UIImage, color:UIColor, mode: UIImageRenderingMode) -> UIImage {
//        let tempImage = image.imageWithRenderingMode(mode)
//        let imageView = UIImageView(image: tempImage)
//        imageView.tintColor = color
//        
//        let tintedImage = imageView.renderImageFromView()
//        
//        return tintedImage
//    }
    func tintImageWithFilter(image: UIImage, color: UIColor) -> UIImage {
        let ciImage = CIImage(image: image)
        let filter = CIFilter(name: "CIMultiplyCompositing")
        
        let colorFilter = CIFilter(name: "CIConstantColorGenerator")
        let ciColor = CIColor(color: color)
        colorFilter!.setValue(ciColor, forKey: kCIInputColorKey)
        let colorImage = colorFilter!.outputImage
        
        filter!.setValue(colorImage, forKey: kCIInputImageKey)
        filter!.setValue(ciImage, forKey: kCIInputBackgroundImageKey)
        
        return UIImage(CIImage: filter!.outputImage!)
    }
    
    func maskImageWithColor(image:UIImage, color:UIColor) -> UIImage {
        let rect:CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: image.size.width, height: image.size.height))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale)
        let c:CGContextRef = UIGraphicsGetCurrentContext()!
        image.drawInRect(rect)
        CGContextSetFillColorWithColor(c, color.CGColor)
        CGContextSetBlendMode(c, .Color)
        CGContextFillRect(c, rect)
        let result:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}


extension UIView: Skinnable {
    func skinViewLabels() {
        for view in self.subviews {
            if view.isMemberOfClass(UILabel) {
                let label = view as! UILabel
                label.textColor = skinTextColor()
            }
        }
    }
    func skinViewLabels(color:UIColor) {
        for view in self.subviews {
            if view.isMemberOfClass(UILabel) {
                let label = view as! UILabel
                label.textColor = color
            }
        }
    }
    
    func addDropShadow() {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 2
        
    }
}

extension UIImage: Skinnable {
    func skinned() -> UIImage {
        if !SkinData.sharedInstance.isDefaultSkin {
            let skinnedImage = maskImageWithColor(self, color: skinPrimaryColor())
            return skinnedImage
        }
        return self
    }
    func skinned(color:UIColor) -> UIImage {
        if !SkinData.sharedInstance.isDefaultSkin {
            let skinnedImage = maskImageWithColor(self, color: color)
            return skinnedImage
        }
        return self
    }
    func skinned(color:UIColor,forced: Bool) -> UIImage {
        if !SkinData.sharedInstance.isDefaultSkin || forced {
            let skinnedImage = maskImageWithColor(self, color: color)
            return skinnedImage
        }
        return self
    }
}
