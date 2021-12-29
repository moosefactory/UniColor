/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory UniColor Framework - v1.0           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2020 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

// Operators.swift - Created by Tristan Leblanc on 25/11/2020.

import Foundation
import CoreGraphics

// MARK: - UniColor Operators Extension -

public extension UniColor {
    
    /// Add two colors by adding rgba values
    
    static func + (lhs: UniColor, rhs: UniColor) -> UniColor {
        return UniColor(red: lhs.r + rhs.r, green: lhs.g + rhs.g, blue: lhs.b + rhs.b, alpha: lhs.a + rhs.a)
    }
    
    
    static func += (lhs: inout UniColor, rhs: UniColor) {
        lhs.r += rhs.r
        lhs.g += rhs.g
        lhs.b += rhs.b
        lhs.a += rhs.a
    }
    
    /// Substract two colors by substracting rgba values
    
    static func - (lhs: UniColor, rhs: UniColor) -> UniColor {
        return UniColor(red: lhs.r - rhs.r, green: lhs.g - rhs.g, blue: lhs.b - rhs.b, alpha: lhs.a - rhs.a)
    }
    
    /// Divide rgba values by an integer value
    
    static func / (lhs: UniColor, rhs: Int) -> UniColor {
        let f = CGFloat(rhs)
        return UniColor(red: lhs.r / f, green: lhs.g / f, blue: lhs.b / f, alpha: lhs.a / f)
    }
    
    /// Divide rgba values by a double value
    
    static func / (lhs: UniColor, rhs: CGFloat) -> UniColor {
        return UniColor(red: lhs.r / rhs, green: lhs.g / rhs, blue: lhs.b / rhs, alpha: lhs.a / rhs)
    }
    
    /// Multiply rgba values by an integer value
    
    static func * (lhs: UniColor, rhs: Int) -> UniColor {
        let f = CGFloat(rhs)
        return UniColor(red: lhs.r * f, green: lhs.g * f, blue: lhs.b * f, alpha: lhs.a * f)
    }
    
    /// Multiply rgba values by a double value
    
    static func * (lhs: UniColor, rhs: CGFloat) -> UniColor {
        return UniColor(red: lhs.r * rhs, green: lhs.g * rhs, blue: lhs.b * rhs, alpha: lhs.a * rhs)
    }
}
