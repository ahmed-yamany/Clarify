//
//  BreathingMeditationSessionStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 02/01/2024.
//

import SwiftUI

struct BreathingMeditationSessionStyle: MeditationSessionStyle {
    func makeBody(configurations: Configurations) -> some View {
        HStack {
            ClarityAsyncImage(url: URL(string: configurations.session.image))
                .frame(width: 88, height: 88)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            content(configurations)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 88)
    }
    
    func content(_ configurations: Configurations) -> some View {
        VStack(alignment: .leading) {
            sessionInformation(configurations)
        }
    }
    
    func sessionInformation(_ configurations: Configurations) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            sessionName(configurations)
            Spacer()
            HStack {
                sessionStatus(configurations)
                sessionTime(configurations)
                Spacer()
            }
            Spacer()
            sessionType(configurations)
        }
        .padding(.vertical)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
    }
    
    func sessionName(_ configurations: Configurations) -> some View {
        Text(configurations.session.name)
            .font(.Large(weight: .semibold))
    }
    
    func sessionStatus(_ configurations: Configurations) -> some View {
        HStack {
            Image(systemName: configurations.session.status == .guided ? "mic.fill" : "mic.slash.fill")
                .foregroundStyle(.clPrimary)
            Text(configurations.session.status.rawValue)
        }
        .font(.medium(weight: .regular))
    }
    
    func sessionTime(_ configurations: Configurations) -> some View {
        HStack {
            Image(systemName: "clock.fill")
                .foregroundStyle(.clPrimary)
            Text(configurations.session.time)
        }
        .font(.medium(weight: .regular))
    }
    
    func sessionType(_ configurations: Configurations) -> some View {
        Text(configurations.session.type)
            .font(.small(weight: .regular))
    }
}

extension MeditationSessionStyle where Self == BreathingMeditationSessionStyle {
    static var breathing: any MeditationSessionStyle {
        BreathingMeditationSessionStyle()
    }
}
