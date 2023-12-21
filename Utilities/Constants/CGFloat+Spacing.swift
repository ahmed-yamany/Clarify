//
//  CGFloat+Spacing.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import UIKit

extension CGFloat {
    // swiftlint: disable all
    static let cl = Clarity()
    static let screenSize: CGSize = UIScreen.main.bounds.size
    // swiftlint: enable all
    
    struct Clarity {
        let contentPadding: CGFloat = 24
    }
}
