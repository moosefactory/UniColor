//   /\/\__/\/\      MFUnicolor
//   \/\/..\/\/      Color Management Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 Utilities.swift
//  􀐚 MFUnicolor
//  􀓣 Created by Tristan Leblanc on 19/12/2021.

import Foundation
import CoreGraphics

extension NumberFormatter {
    
    /// 3 Decimals formatter - Usefull to improve debug logs readability
    
    static let formatter3Dec: NumberFormatter = {
        let f = NumberFormatter()
        f.maximumFractionDigits = 3
        return f
    }()
    
}

// MARK: - Double Extension -

public extension Double {
    
    /// Returns the double as a string with 3 decimals precision
    
    var dec3: String {
        let n = NSNumber(value: Double(self))
        return NumberFormatter.formatter3Dec.string(from: n) ?? "\(self)"
    }
    
    @_transparent
    var clampToPositiveFractional: Double {
        return Swift.max(Double(0), Swift.min(Double(1), self))
    }
    
}

// MARK: - CGFloat Extension -

public extension CGFloat {
    
    /// Returns the cgFloat as a string with 3 decimals precision
    
    var dec3: String {
        Double(self).dec3
    }
    
    @_transparent
    var clampToPositiveFractional: CGFloat {
        return Swift.max(CGFloat(0), Swift.min(CGFloat(1), self))
    }
}
