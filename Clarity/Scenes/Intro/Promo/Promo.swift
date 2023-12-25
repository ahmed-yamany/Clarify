//
//  Promo.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct Promo: Hashable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let image: String
    
    var imageUrl: URL? {
        URL(string: image)
    }
    
    var imageResource: ImageResource {
        ImageResource(name: image, bundle: .main)
    }
}

// swiftlint: disable all
extension Promo {
    static var samples: [Promo] {
        [
            Promo(id: "1", title: "STRESS LESS.", subtitle: "Make mindfulness a daily habit and be kind to your mind.", image: "image-promo-1"),
            Promo(id: "2", title: "RELAX MORE.", subtitle: "Unwind and find serenity in a guided meditation sessions", image: "image-promo-2"),
            Promo(id: "3", title: "SLEEP LONGER.", subtitle: "Calm racing mind and prepare your body for deep sleep.", image: "image-promo-3"),
            Promo(id: "4", title: "LIVE BETTER.", subtitle: "Invest in personal sense of inner peace and balance.", image: "image-promo-4")
        ]
    }
}
// swiftlint: enable all
