//
/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory UniColor Framework - v1.0           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2020 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

// Palette.swift - Created by Tristan Leblanc on 23/12/2021.

import Foundation

public extension UniColor {
    
    static let clear = UniColor(hexString: "#00000000")
    
    static let black = UniColor(hexString: "#000000")
    static let white = UniColor(hexString: "#FFFFFF")
    
    // red, green, blue - This is why UniCOlor components are named r,g,b ;)
    
    static let red = UniColor(hexString: "#EE4836")
    static let green = UniColor(hexString: "#66D53F")
    static let blue = UniColor(hexString: "#3B87FF")
    
    // SwiftUI Color
    
    static let orange = UniColor(hexString: "#F29E00")
    static let yellow = UniColor(hexString: "#F8D500")
    static let cyan = UniColor(hexString: "#75C8F7")
    static let purple = UniColor(hexString: "#B560F6")
    static let pink = UniColor(hexString: "#ED3C5E")
    static let mint = UniColor(hexString: "#84E5E2")
    static let brown = UniColor(hexString: "#A88D66")
    
    static let gray = gray_50_percent
    static let darkGray = gray_70_percent
    static let lightGray = gray_30_percent
    
    // Grays with percent of black
    
    static let gray_10_percent = UniColor(red: 0.90, green: 0.90, blue: 0.90)
    static let gray_20_percent = UniColor(red: 0.80, green: 0.80, blue: 0.80)
    static let gray_25_percent = UniColor(red: 0.75, green: 0.75, blue: 0.75)
    static let gray_30_percent = UniColor(red: 0.70, green: 0.70, blue: 0.70)
    static let gray_40_percent = UniColor(red: 0.60, green: 0.60, blue: 0.60)
    static let gray_45_percent = UniColor(red: 0.55, green: 0.55, blue: 0.55)
    static let gray_50_percent = UniColor(red: 0.50, green: 0.50, blue: 0.50)
    static let gray_60_percent = UniColor(red: 0.40, green: 0.40, blue: 0.40)
    static let gray_70_percent = UniColor(red: 0.30, green: 0.30, blue: 0.30)
    static let gray_75_percent = UniColor(red: 0.25, green: 0.25, blue: 0.25)
    static let gray_80_percent = UniColor(red: 0.20, green: 0.20, blue: 0.20)
    static let gray_90_percent = UniColor(red: 0.10, green: 0.10, blue: 0.10)
}
