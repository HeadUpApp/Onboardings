import SwiftUI

public extension Font {
    /// Inter Light 18pt font
    static let interLight18 = Font.custom("Inter_18pt-Light", size: 18)
    
    /// Inter Medium 28pt font
    static let interMedium28 = Font.custom("Inter_28pt-Medium", size: 28)
    
    /// Inter Light font with custom size
    static func interLight(size: CGFloat) -> Font {
        return Font.custom("Inter_18pt-Light", size: size)
    }
    
    /// Inter Medium font with custom size
    static func interMedium(size: CGFloat) -> Font {
        return Font.custom("Inter_28pt-Medium", size: size)
    }
}

