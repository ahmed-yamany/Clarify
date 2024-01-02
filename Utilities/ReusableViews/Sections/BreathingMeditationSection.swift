//
//  BreathingMeditationSection.swift
//  Clarity
//
//  Created by Ahmed Yamany on 02/01/2024.
//

import SwiftUI

struct BreathingMeditationSection: View {
    let sessions: [MeditationSession]
    let title: String
    
    var body: some View {
        Section {
            content
        } header: { header }
    }
    
    var header: some View {
        SectionHeader(title: title)
    }
    
    var content: some View {
        VStack(spacing: 16) {
            ForEach(sessions) { session in
                MeditationSessionCell(session: session)
                    .frame(height: 88)
            }
        }
        .meditationSessionCellSytle(.breathing)
    }
}
