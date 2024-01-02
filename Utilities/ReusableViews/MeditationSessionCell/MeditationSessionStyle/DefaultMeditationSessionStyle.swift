//
//  DefaultMeditationSession.swift
//  Clarity
//
//  Created by Ahmed Yamany on 01/01/2024.
//

import SwiftUI

struct DefaultMeditationSessionStyle: MeditationSessionStyle {
    func makeBody(configurations: Configurations) -> some View {
        ZStack {
            ClarityAsyncImage(url: URL(string: configurations.session.image))
            content(configurations)
        }
        .frame(width: 140, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    func content(_ configurations: Configurations) -> some View {
        VStack(alignment: .leading) {
            Spacer()
            sessionInformation(configurations)
        }
    }
    
    func sessionInformation(_ configurations: Configurations) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                sessionName(configurations)
                HStack {
                    sessionStatus(configurations)
                    sessionTime(configurations)
                    Spacer()
                }
            }
            Spacer()
            
        }
        .padding(.vertical)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .background(.ultraThinMaterial)
    }
    
    func sessionName(_ configurations: Configurations) -> some View {
        Text(configurations.session.name)
            .font(.medium(weight: .bold))
    }
    
    func sessionStatus(_ configurations: Configurations) -> some View {
        HStack {
            Image(systemName: configurations.session.status == .guided ? "mic.fill" : "mic.slash.fill")
            Text(configurations.session.status.rawValue)
        }
        .font(.XSmall(weight: .regular))
    }
    
    func sessionTime(_ configurations: Configurations) -> some View {
        HStack {
            Image(systemName: "clock.fill")
            Text(configurations.session.time)
        }
        .font(.XSmall(weight: .regular))
    }
    
}

extension MeditationSessionStyle where Self == DefaultMeditationSessionStyle {
    static var `default`: any MeditationSessionStyle {
        DefaultMeditationSessionStyle()
    }
}
