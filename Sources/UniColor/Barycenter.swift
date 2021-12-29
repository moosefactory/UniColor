/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory UniColor Framework - v1.0           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2020 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

// UniColor+Barycenter.swift - Created by Tristan Leblanc on 23/12/2021.

import Foundation
import CoreGraphics

public extension UniColor {
    
    static func baryColor(_ color1: UniColor, _ color2: UniColor, fraction: CGFloat = 0.5) -> UniColor {
        
        return UniColor(red: color1.r.bary(to: color2.r, fraction: fraction),
                        green: color1.g.bary(to: color2.g, fraction: fraction),
                        blue: color1.b.bary(to: color2.b, fraction: fraction),
                        alpha: color1.a.bary(to: color2.a, fraction: fraction))
    }
    
}

extension CGFloat {
    
    @_transparent
    func bary(to: CGFloat, fraction: CGFloat = 0.5) -> CGFloat {
        let f = fraction.clampToPositiveFractional
        return self * (1 - f) + to * f
    }
}
