//   /\/\__/\/\      MFUnicolor
//   \/\/..\/\/      Color Management Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 UniColor.swift
//  􀐚 MFUnicolor
//  􀓣 Created by Tristan Leblanc on 25/11/2020.


#if !os(watchOS)

import Foundation
import QuartzCore

import simd
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

import SwiftUI

// MARK: - Colors HSLA, HSBA and RGBA Tuples

public typealias HSLATuple = (h: CGFloat, s: CGFloat, l: CGFloat, a: CGFloat)
public typealias HSBATuple = (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat)
public typealias RGBATuple = (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)

// MARK: - Unicolor Structure

public struct UniColor: Codable, Equatable {
    
    /// Components
    
    public var r: CGFloat = 0
    public var g: CGFloat = 0
    public var b: CGFloat = 0
    public var a: CGFloat = 0
    
    public init() {
        self.r = 0
        self.g = 0
        self.b = 0
        self.a = 1
    }
    
    // MARK: Initialisation
    
#if os(macOS)
    public init(_ nsColor: NSColor) {
        self.init(nsColor.cgColor)
    }
#else
    public init(_ uiColor: UIColor) {
        self.init(uiColor.cgColor)
    }
#endif
    
    public init(_ cgColor: CGColor) {
        let c = cgColor.components
        let n = cgColor.numberOfComponents
        switch n {
        case 1:
            r = c?[0] ?? 0
            g = c?[0] ?? 0
            b = c?[0] ?? 0
            a = 1
        case 3:
            r = c?[0] ?? 0
            g = c?[1] ?? 0
            b = c?[2] ?? 0
            a = 1
        case 4:
            r = c?[0] ?? 0
            g = c?[1] ?? 0
            b = c?[2] ?? 0
            a = c?[3] ?? 1
        default:
            r = 0
            g = 0
            b = 0
            a = 1
        }
    }
    
    public init(red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1) {
        self.r = red
        self.g = green
        self.b = blue
        self.a = alpha
    }
    
    enum CodingKeys: String, CodingKey {
        case r
        case g
        case b
        case a
    }
    
    public func with(alpha: CGFloat) -> UniColor {
        return UniColor(red: r, green: g, blue: b, alpha: a)
    }
    
    static func == (lhs: UniColor, rhs: UniColor) {
        if lhs.r != rhs.r { return }
        if lhs.g != rhs.g { return }
        if lhs.b != rhs.b { return }
        if lhs.a != rhs.a { return }
    }
}


public extension UniColor {
    var simd: simd_float4 { return [Float(r), Float(g), Float(b), Float(a)] }
    
#if os(macOS)
    var cgColor: CGColor { if #available(OSX 10.15, *) {
        return CGColor(srgbRed: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    } else {
        return CGColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }}
#else
    var cgColor: CGColor { return CGColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))}
#endif
}

extension UniColor: CustomStringConvertible {
    public var description: String {
        return "r:\(r.dec3) g:\(g.dec3) b:\(b.dec3) a:\(a.dec3) "
    }
}

public extension UniColor {
    
    var rgba: RGBATuple { return (r, g, b, a) }
    
    var hsla: HSLATuple {
        var hsla: HSLATuple = (h: 0, s:0, l: 0, a: a)
        let minRGB = min(r, min(g, b));
        let maxRGB = max(r, max(g, b));
        
        guard minRGB != maxRGB else {
            hsla.l = minRGB
            return hsla
        }
        
        let d: CGFloat = r == minRGB ? g-b
        : b == minRGB ? r-g : b-r
        let h: CGFloat = r == minRGB ? 3
        : b == minRGB ? 1 : 5
        hsla.h = (h - d / (maxRGB - minRGB)) / 6
        hsla.s = (maxRGB - minRGB) / maxRGB
        hsla.l = maxRGB
        
        if hsla.l > 0 && hsla.l <= 0.5 {
            hsla.s = (maxRGB - minRGB) / (2 * hsla.l)
        } else {
            hsla.s = (maxRGB - minRGB)/(2 - 2 * hsla.l)
        }
        
        return hsla
    }
    
    var hsba: HSBATuple {
        var hsba: HSBATuple = (h: 0, s:0, b: 0, a: a)
        let minRGB = min(r, min(g, b));
        let maxRGB = max(r, max(g, b));
        
        guard minRGB != maxRGB else {
            hsba.b = minRGB
            return hsba
        }
        
        let d: CGFloat = r == minRGB ? g-b
        : b == minRGB ? r-g : b-r
        let h: CGFloat = r == minRGB ? 3
        : b == minRGB ? 1 : 5
        hsba.h = (h - d / (maxRGB - minRGB)) / 6
        hsba.b = maxRGB
        hsba.s = (maxRGB - minRGB) / maxRGB
        
        return hsba
    }
    
    func opacity(_ value: CGFloat) -> UniColor {
        UniColor(red: r, green: g, blue: b, alpha: value)
    }

    func with(brightnessFactor: CGFloat) -> UniColor {
        var hsla = self.hsla
        hsla.l = max(min(hsla.l * brightnessFactor, 1),0)
        return PlatformColor(hsla: hsla).color
    }
        
    var darken: UniColor {
        return with(brightnessFactor: 0.50)
    }
    
    var lighten: UniColor {
        return with(brightnessFactor: 2)
    }
    
    /// Returns a black or white color that is visible on a background of given color
    static func visibleColor(on color: UniColor) -> UniColor {
        let brightness = color.hsla.l
        return brightness < 0.35 ? .white : .black
    }
}


// MARK: - Color/Hex Conversion

public extension UniColor {
    
    init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let red = CGFloat(Int(color >> 16) & mask) / 255.0
        let green = CGFloat(Int(color >> 8) & mask) / 255.0
        let blue = CGFloat(Int(color) & mask) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var hex: String {
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}

// MARK: - SwiftUI Color Conversion

public extension UniColor {
    
    @inlinable var alpha: CGFloat { a }
    @inlinable var red: CGFloat { r }
    @inlinable var green: CGFloat { g }
    @inlinable var blue: CGFloat { b }

    @available(iOS 14.0, *)
    var suiColor: SwiftUI.Color {
        return SwiftUI.Color(cgColor)
    }
    
}

#if os(macOS)

// MARK: - MacOS

public extension UniColor {
    var nsColor: NSColor { platformColor }
}

#else

// MARK: - iOS

public extension UniColor {
    var uiColor: UIColor { platformColor }
}

#endif

#endif
