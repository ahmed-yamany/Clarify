//
//  TermsViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 24/12/2023.
//

import SwiftUI

class TermsConditionsViewModel: ObservableObject {
    @Published var agreeToTerms: Bool = true
    @Published var agreeToHealthData: Bool = false
    @Published var agreeToMarketing: Bool = false
}
