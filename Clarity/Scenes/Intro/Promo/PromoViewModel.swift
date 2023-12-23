//
//  PromoViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

class PromoViewModel: ObservableObject {
    @Published var selectedPromoIndex: Int = 0
    @Published var promos: [Promo] = []
    
    func getPromos() async throws -> [Promo] {
        Promo.samples
    }
    
    func promoMove(onEndPerform completion: () -> Void) {
        if selectedPromoIndex < promos.count - 1 {
            selectedPromoIndex += 1
        } else {
            completion()
        }
    }
}
