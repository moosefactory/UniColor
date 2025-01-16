//   /\/\__/\/\      MFUnicolor
//   \/\/..\/\/      Color Management Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 CGColor+Extras.swift
//  􀐚 MFUnicolor
//  􀓣 Created by Tristan Leblanc on 27/04/2020.

#if !os(watchOS)

import Foundation
import QuartzCore
#if os(macOS)
import Cocoa
public typealias PlatformColor = NSColor
#else
import UIKit
public typealias PlatformColor = UIColor
#endif

// MARK: - CGColor

public extension CGColor {
    
    /// hsla
    ///
    /// Return Hue/Saturation/Lightness/Alpha values
    var hsla: HSLATuple {
        return color.hsla
    }
    
    /// rgba
    ///
    /// Return Red/Green/Blue/Alpha values
    var rgba: RGBATuple {
        let color = self.color
        return (
            r: color.r,
            g: color.g,
            b: color.b,
            a: color.a
        )
    }
    
    /// platformColor
    ///
    /// Returns either a NSColor or a UIColor
    var platformColor: PlatformColor {
        let color = self.color
        return PlatformColor(red: color.r, green: color.g, blue: color.b, alpha: color.a)
    }
    
    /// init(hex: String)
    ///
    /// Init with hexadecimal representation
    static func make(with hex: String) -> CGColor {
        return UniColor(hexString: hex).cgColor
    }
    
    /// init(hsla: HSLATuple)
    ///
    /// Init with Hue/Saturation/Lightness/Alpha values
    static func make(with hsla: HSLATuple) -> CGColor {
        return UniColor(hsla: hsla).cgColor
    }
    
    /// init(hsla: HSLATuple)
    ///
    /// Init with Red/Green/Blue/Alpha values
    @available(iOS 13.0, *)
    static func make(with rgba: RGBATuple) -> CGColor {
        CGColor(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
}

// MARK: - CGColor to Color conversion

public extension CGColor {
    
    /// Return a UniColor from a CGColor
    var color: UniColor {
        guard let comps = components else {
            return .black
        }
        let n = numberOfComponents
        switch n {
            // Grayscale
        case 1:
            return UniColor(red: comps[0], green: comps[0], blue: comps[0], alpha: 1)
            // Grayscale with alpha
        case 2:
            return UniColor(red: comps[0], green: comps[0], blue: comps[0], alpha: comps[1])
            // RGB
        case 3:
            return UniColor(red: comps[0], green: comps[1], blue: comps[2], alpha: 1)
            // RGB with alpha
        case 4:
            return UniColor(red: comps[0], green: comps[1], blue: comps[2], alpha: comps[3])
        default:
            return .black
        }
    }
}

// MARK: - MacOS/iOS Colors

public extension PlatformColor {
    
    var color: UniColor { cgColor.color }
    
    var hsla: HSLATuple { color.hsla }
    
    var rgba: RGBATuple { color.rgba }
    
    
    convenience init(color: UniColor) {
        self.init(red: color.r, green: color.g, blue: color.b, alpha: color.a)
    }
    
    convenience init(hsla: HSLATuple) {
        self.init(hue: hsla.h, saturation: hsla.s, brightness: hsla.l, alpha: hsla.a)
    }
    
    convenience init(rgba: RGBATuple) {
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
}

public extension UniColor {
    
    init(hsla: HSLATuple) {
        let platformColor = PlatformColor(hsla: hsla)
        self = platformColor.color
    }
    
    var platformColor: PlatformColor {
        PlatformColor(red: r, green: g, blue: b, alpha: a)
    }
}

// MARK: - Color/Hex Conversion

public extension PlatformColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        self.init(color: UniColor(hexString: hexString))
    }
    
    var hex: String {
        return color.hex
    }
}

#endif
