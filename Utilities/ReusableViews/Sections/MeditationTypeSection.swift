//
//  MeditationTypeSection.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import SwiftUI

struct MeditationTypeSection: View {
    let title: String
    let types: [MeditationType]
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 164, maximum: 164),
                                                spacing: CGFloat.cl.contentPadding)]
    
    var body: some View {
        Section {
            LazyVGrid(columns: columns) {
                ForEach(types) { meditationtype in
                    MeditationTypeCell(type: meditationtype)
                        .padding(.top, CGFloat.cl.contentPadding)
                }
            }
        } header: {
            SectionHeader(title: title)
        }
        .padding(.horizontal, CGFloat.cl.contentPadding)
    }
}

#Preview {
    TabBarView()
}
