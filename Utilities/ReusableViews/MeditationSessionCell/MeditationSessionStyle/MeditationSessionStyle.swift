//
//  MeditationSessionStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 01/01/2024.
//

import SwiftUI

struct MeditationSessionConfigurations {
    let session: MeditationSession
}

protocol MeditationSessionStyle {
    associatedtype Body: View
    typealias Configurations = MeditationSessionConfigurations
    
    @ViewBuilder
    func makeBody(configurations: Configurations) -> Body
}

struct MeditationSessionStyleKey: EnvironmentKey {
    static var defaultValue: any MeditationSessionStyle = DefaultMeditationSessionStyle()
}

extension EnvironmentValues {
    var meditationSessionCellStyle: any MeditationSessionStyle {
        get { self[MeditationSessionStyleKey.self] }
        set { self[MeditationSessionStyleKey.self] = newValue }
    }
}

extension View {
    @ViewBuilder
    func meditationSessionCellSytle(_ style: any MeditationSessionStyle) -> some View {
        environment(\.meditationSessionCellStyle, style)
    }
}

struct MeditationSessionCellKey: EnvironmentKey {
    static var defaultValue: (MeditationSession) -> Void = {_ in }
}

extension EnvironmentValues {
    var meditationSessionAction: (MeditationSession) -> Void {
        get { self[MeditationSessionCellKey.self] }
        set { self[MeditationSessionCellKey.self] = newValue }
    }
}

extension View {
    @ViewBuilder
    func onTabMeditationSessionCell(_ action: @escaping (MeditationSession) -> Void) -> some View {
        environment(\.meditationSessionAction, action)
    }
}
