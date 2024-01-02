//
//  HomeViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var meditationSession: MeditationSession?
    @Published var search: String = ""
    
    func getAllMeditationSessions() async throws -> [MeditationSession] {
        MeditationSession.samples
    }
    
    func getTrendingMeditationSessions() async throws -> [MeditationSession] {
        MeditationSession.trending
    }
    
    func getRainMeditionSessions() async throws -> [MeditationSession] {
        MeditationSession.rain
    }
    
    func getBreathingMeditionSessions() async throws -> [MeditationSession] {
        MeditationSession.breathing
    }
    
    func getSections(for meditationSession: MeditationSession) async throws -> [MeditationSection] {
        MeditationSection.sections
    }
}
