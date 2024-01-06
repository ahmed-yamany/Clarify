//
//  MeditationTypeCell.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import SwiftUI

struct MeditationTypeCell: View {
    let type: MeditationType
    
    var body: some View {
        ZStack {
            ClarityAsyncImage(url: URL(string: type.image))
            content
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(width: 164, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    var content: some View {
        HStack {
            name
            Spacer()
            sessionsCount
        }
        .padding(.vertical)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 36)
        .background(.ultraThinMaterial)
    }
    
    var name: some View {
        Text(type.name)
            .font(.medium(weight: .bold))
    }
    
    var sessionsCount: some View {
        Text("\(type.sessions.count) Sessions")
            .font(.small(weight: .regular))
    }
    
}
