//
//  SuggestedMeditationSessionStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 01/01/2024.
//

import SwiftUI

struct SuggestedMeditationSessionStyle: MeditationSessionStyle {
        
    func makeBody(configurations: Configurations) -> some View {
        ZStack {
            ClarityAsyncImage(url: URL(string: configurations.session.image))
            
            content(configurations)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 192)
        .background(.clInputField.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
      
    }
    
    func content(_ configurations: Configurations) -> some View {
        VStack(alignment: .leading) {
            sessionType(configurations)
            Spacer()
            sessionInformation(configurations)
        }
    }
    
    func sessionType(_ configurations: Configurations) -> some View {
        Text(configurations.session.type)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
    }
    
    func sessionInformation(_ configurations: Configurations) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                sessionName(configurations)
                HStack {
                    sessionStatus(configurations)
                    sessionTime(configurations)
                    Spacer()
                }
            }
            Spacer()
            
            rate(configurations)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 68)
        .background(.ultraThinMaterial)
    }
    
    func sessionName(_ configurations: Configurations) -> some View {
        Text(configurations.session.name)
            .font(.Large(weight: .bold))
    }
    
    func sessionStatus(_ configurations: Configurations) -> some View {
        HStack {
            Image(systemName: configurations.session.status == .guided ? "mic.fill" : "mic.slash.fill")
            Text(configurations.session.status.rawValue)
        }
        .font(.XSmall(weight: .medium))
    }
    
    func sessionTime(_ configurations: Configurations) -> some View {
        HStack {
            Image(systemName: "clock.fill")
            Text(configurations.session.time)
        }
        .font(.XSmall(weight: .medium))
    }
    
    func rate(_ configurations: Configurations) -> some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundStyle(Color.yellow)
            Text(String(format: "%.1f", configurations.session.rate))
        }
        .font(.small(weight: .medium))
        .padding(8)
        .background(.ultraThickMaterial.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .environment(\.colorScheme, .dark)
    }
}

extension MeditationSessionStyle where Self == SuggestedMeditationSessionStyle {
    static var suggestedStyle: any MeditationSessionStyle {
        SuggestedMeditationSessionStyle()
    }
}

#Preview {
    MeditationSessionCell(session: .sample)
        .meditationSessionCellSytle(.suggestedStyle)
}
