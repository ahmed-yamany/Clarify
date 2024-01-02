//
//  MeditationSessionCell.swift
//  Clarity
//
//  Created by Ahmed Yamany on 01/01/2024.
//

import SwiftUI

struct MeditationSessionCell: View {
    let session: MeditationSession
    
    @Environment(\.meditationSessionAction) private var meditationSessionAction
    @Environment(\.meditationSessionCellStyle) private var style
    
    var body: some View {
        let configurations = MeditationSessionConfigurations(session: session)
        return AnyView(style.makeBody(configurations: configurations))
            .onTapGesture {
                meditationSessionAction(session)
            }
    }
}
