//
//  DiscoverViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import SwiftUI

class DiscoverViewModel: ObservableObject {
    @Published var search: String = ""
    
    func getMeditationTypes() async throws -> [MeditationType] {
        MeditationType.samples
    }
    
    func submitSearch() async throws -> [MeditationType] {
        return [[], MeditationType.samples.shuffled()].randomElement() ?? []
    }
}
