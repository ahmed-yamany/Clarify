//
//  UIFont+Style.swift
//  Clarity
//
//  Created by Ahmed Yamany on 20/12/2023.
//

import SwiftUI

// swiftlint: disable all
// An extension to provide custom font styles using the Cairo and Poppins font families.
public extension Font {

    static var h1: Font {
        return .custom(size: 48, weight: .bold)
    }

    static var h2: Font {
        return .custom(size: 40, weight: .bold)
    }

    static var h3: Font {
        return .custom(size: 32, weight: .bold)
    }
    
    static var h4: Font {
        return .custom(size: 24, weight: .bold)
    }
    
    static var h5: Font {
        return .custom(size: 20, weight: .bold)
    }
    
    static var h6: Font {
        return .custom(size: 18, weight: .bold)
    }
    
    static func XLarge(weight: Font.Weight) -> Font {
        .custom(size: 18, weight: weight)
    }
    
    static func Large(weight: Font.Weight) -> Font {
        .custom(size: 16, weight: weight)
    }
    
    static func medium(weight: Font.Weight) -> Font {
        .custom(size: 14, weight: weight)
    }
    
    static func small(weight: Font.Weight) -> Font {
        .custom(size: 12, weight: weight)
    }
    
    static func XSmall(weight: Font.Weight) -> Font {
        .custom(size: 10, weight: weight)
    }
    
    /// Returns a custom font with the specified size and weight.
    ///
    /// - Parameters:
    ///   - size: The size of the font in points.
    ///   - weight: The weight of the font.
    /// - Returns: A custom font with the given size and weight.
    static func custom(size: CGFloat, weight: Font.Weight) -> Font {
        let fontName = self.fontName(forWeight: weight)
        return Font.custom(fontName, size: size)
    }
    
    /// Returns the appropriate font name based on the specified weight.
    ///
    /// - Parameter weight: The weight of the font.
    /// - Returns: The font name associated with the specified weight.
    static private func fontName(forWeight weight: Font.Weight) -> String {
        switch weight {
        case .regular: return "SFProDisplay-Regular"
        case .medium: return "SFProDisplay-Medium"
        case .semibold: return "SFProDisplay-Semibold"
        case .bold: return "SFProDisplay-Bold"
        default: return "SFProDisplay-Regular"
        }
    }
}
// swiftlint: enable all
