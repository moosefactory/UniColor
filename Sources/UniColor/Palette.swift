//   /\/\__/\/\      MFUnicolor
//   \/\/..\/\/      Color Management Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 Palette.swift
//  􀐚 MFUnicolor
//  􀓣 Created by Tristan Leblanc on 23/12/2021.

import Foundation
// For hexString initialisation
import MFFoundation

#if os(macOS)
    import AppKit
#else
    import UIKit
#endif

public extension UniColor {
    
    static let clear = UniColor(hexString: "#00000000")
    
    struct System {
        
    #if os(macOS)
        
        public static let control = UniColor(NSColor.controlColor)
        public static let controlText = UniColor(NSColor.controlTextColor)
        public static let selectedControlText = UniColor(NSColor.selectedControlTextColor)
        public static let controlsBackground = UniColor(NSColor.controlBackgroundColor)

        public static let text = UniColor(NSColor.textColor)

        public static let clear = UniColor(NSColor.clear)
        
        public static let black = UniColor(NSColor.black)
        public static let darkGray = UniColor(NSColor.darkGray)
        public static let lightGray = UniColor(NSColor.lightGray)
        public static let white = UniColor(NSColor.white)

        public static let red = UniColor(NSColor.systemRed)
        public static let blue = UniColor(NSColor.systemBlue)
        public static let gray = UniColor(NSColor.systemGray)
        public static let mint = UniColor(NSColor.systemMint)
        public static let pink = UniColor(NSColor.systemPink)
        public static let teal = UniColor(NSColor.systemTeal)
        public static let brown = UniColor(NSColor.systemBrown)
        public static let green = UniColor(NSColor.systemGreen)
        public static let indigo = UniColor(NSColor.systemIndigo)
        public static let orange = UniColor(NSColor.systemOrange)
        public static let purple = UniColor(NSColor.systemPurple)
        public static let yellow = UniColor(NSColor.systemYellow)
        

        @available(macOS 12.0, *)
        public static let cyan = UniColor(NSColor.systemCyan)

    #endif
    }
    
    static let black = UniColor(hexString: "#000000")
    static let white = UniColor(hexString: "#FFFFFF")
    
    // Components
    
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
