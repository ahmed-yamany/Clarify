//
//  HomeView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

enum HomeNavigationEnum: String, Hashable {
    case search
    case allSessions
    case meditationSession
   
    @ViewBuilder
    func view() -> some View {
        switch self {
            case .meditationSession: MeditationSessionView()
            case .allSessions: AllMeditationSessionsView()
            default: Text("")
        }
    }
}

class HomeNavigation: Navigation<HomeNavigationEnum> { }

struct HomeView: View {
    @StateObject private var navigation = HomeNavigation()
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var trendingSessions: [MeditationSession] = []
    @State private var rainSessions: [MeditationSession] = []
    @State private var breathingSessions: [MeditationSession] = []
    
    var body: some View {
        NavigationStack(path: $navigation.routes) {
            content
                .applyPrimaryDesign()
            // This visibles the navigation bar
            // and solves a toolbar visible bug
                .toolbar { ToolbarItem(placement: .navigation) { Text("") } }
                .navigationItemBackButtonTitle("")
                .navigationBarBackButtonImage(.iconBack)
                .navigationDestination(for: HomeNavigationEnum.self) { route in
                    route.view()
                        .navigationItemBackButtonTitle("")
                        .environmentObject(navigation)
                        .environmentObject(viewModel)
                }
        }
        .tint(.clTextBody)
        .task {
            do {
                trendingSessions = try await viewModel.getTrendingMeditationSessions()
                rainSessions = try await viewModel.getRainMeditionSessions()
                breathingSessions = try await viewModel.getBreathingMeditionSessions()
            } catch {}
        }
    }
    
    var content: some View {
        ScrollView {
            VStack(spacing: CGFloat.cl.contentPadding) {
                suggestionsSection
                trendingSection
                rainSoundsSection
                breathingSection
                Button("Logout") {
                    AppRouter.shared.logout()
                }
            }
            .padding(.horizontal, CGFloat.cl.contentPadding)
        }
        .onTabMeditationSessionCell { meditationSession in
            viewModel.meditationSession = meditationSession
            navigation.navigate(to: .meditationSession)
        }
    }
    
    var suggestionsSection: some View {
        HomeSuggetionSection(sesstion: .sample, viewAllAction: {
            navigation.navigate(to: .allSessions)
        })
    }
    
    var trendingSection: some View {
        MeditationDefaultSection(sessions: trendingSessions,
                                 title: "Trending",
                                 viewAllTitle: "View All",
                                 viewAllAction: {
        })
        .meditationSessionCellSytle(.trending)
    }
    
    var rainSoundsSection: some View {
        MeditationDefaultSection(sessions: rainSessions,
                                 title: "Rain and Storm Sounds",
                                 viewAllTitle: "\(trendingSessions.count) Sessions",
                                 viewAllAction: {
        })
        .meditationSessionCellSytle(.default)
    }
    
    var breathingSection: some View {
        BreathingMeditationSection(sessions: breathingSessions,
                                   title: "Breathing Sessions")
    }
}

#Preview {
    TabBarView()
}

private struct HomeSuggetionSection: View {
    let sesstion: MeditationSession
    let viewAllAction: () -> Void
    var body: some View {
        Section {
            MeditationSessionCell(session: .sample)
        } header: { header }
        .meditationSessionCellSytle(.suggestedStyle)
    }
    
    var header: some View {
        SectionHeader(title: "Suggested for you...", viewAllTitle: "View All") {
            viewAllAction()
        }
    }
}
