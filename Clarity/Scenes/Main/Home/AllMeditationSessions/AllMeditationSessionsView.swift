//
//  AllMeditationSessionsView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

struct AllMeditationSessionsView: View {
    @EnvironmentObject var navigation: HomeNavigation
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @State private var sessions: [MeditationSession] = []
    
    var body: some View {
        List {
            Section {
                ForEach(sessions) { session in
                    MeditationSessionCell(session: session)
                }
                .listRowBackground(Color.clear)
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .meditationSessionCellSytle(.suggestedStyle)
        }
        .task {
            do {
                sessions = try await homeViewModel.getAllMeditationSessions()
            } catch {}
        }
        .scrollIndicators(.hidden)
        .applyPrimaryDesign()
        .scrollContentBackground(.hidden)
        .listStyle(.automatic)
        .listRowSpacing(24)
        .onTabMeditationSessionCell { meditationSession in
            homeViewModel.meditationSession = meditationSession
            navigation.navigate(to: .meditationSession)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                SearchTextField(title: "Search", text: $homeViewModel.search)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AllMeditationSessionsView()
            .environmentObject(HomeNavigation())
            .environmentObject(HomeViewModel())
    }
}
