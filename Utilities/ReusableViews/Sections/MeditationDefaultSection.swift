//
//  TrendingSection.swift
//  Clarity
//
//  Created by Ahmed Yamany on 01/01/2024.
//

import SwiftUI

struct MeditationDefaultSection: View {
    let sessions: [MeditationSession]
    let title: String
    var viewAllTitle: String?
    var viewAllAction: (() -> Void)?
    
    var body: some View {
        Section {
            content
        } header: { header }
    }
    
    var header: some View {
        SectionHeader(title: title, viewAllTitle: viewAllTitle) {
            viewAllAction?()
        }
    }
    
    var content: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(sessions) { session in
                    MeditationSessionCell(session: session)
                }
            }
            .padding(.horizontal, CGFloat.cl.contentPadding)
        }
        .padding(.horizontal, -CGFloat.cl.contentPadding)
    }
}

#Preview {
    MeditationDefaultSection(sessions: [.sample],
                             title: "Trending",
                             viewAllTitle: "", viewAllAction: {})
}
