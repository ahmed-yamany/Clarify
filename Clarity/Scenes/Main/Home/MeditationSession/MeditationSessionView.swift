//
//  MeditationSessionView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

struct MeditationSessionView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var navigation: HomeNavigation
    
    @State private var rainSessions: [MeditationSession] = []
    @State private var sections: [MeditationSection] = []
    @State var showDetails: Bool = false
    
    var body: some View {
        // Check if a meditation session is available
        if let meditationSession = homeViewModel.meditationSession {
            contentView(session: meditationSession)
        } else {
            Text("Something is wrong")
        }
    }
    
    @ViewBuilder
    private func contentView(session: MeditationSession) -> some View {
        contentStack(session: session)
            .applyPrimaryDesign()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showDetails.toggle()
                    } label: {
                        Image(.iconShowDetails)
                    }
                }
            }
            .task {
                // Fetch rain meditation sessions and sections asynchronously
                do {
                    rainSessions = try await homeViewModel.getRainMeditionSessions()
                    sections = try await homeViewModel.getSections(for: .sample)
                } catch {
                    // Handle errors during fetching
                }
            }
    }
    
    @ViewBuilder
    private func contentStack(session: MeditationSession) -> some View {
        ZStack {
            VStack {
                // Display the meditation session image
                ClarityAsyncImage(url: URL(string: session.image))
                    .ignoresSafeArea()
                    .overlay {
                       details(session: session)
                            .isHidden(!showDetails)
                    }
                    .overlay(alignment: .topLeading) {
                        // Display details about the meditation session
                        sessionDetailsView(session: session)
                            .isHidden(showDetails)
                    }
                    .frame(height: showDetails ?
                           CGFloat.screenSize.height :
                            CGFloat.screenSize.height * 0.5)
                
                Spacer()
            }
            
            // Display a scrollable view for sections
            ScrollView {
                Spacer().frame(height: CGFloat.screenSize.height * 0.2)
                sectionsView()
            }.isHidden(showDetails)
        }
    }
    
    // Display sections of meditation sessions
    private func sessionDetailsView(session: MeditationSession) -> some View {
        VStack(alignment: .leading) {
            Text(session.name)
                .font(.h3)
            
            Text("36 practices")
                .font(.medium(weight: .semibold))
            
            Text("Sounds of nature have a replenishing and restorative effect on the body.")
                .font(.medium(weight: .semibold))
                .frame(maxWidth: 230)
        }
        .padding(CGFloat.cl.contentPadding)
    }
    
    private func sectionsView() -> some View {
        VStack(spacing: CGFloat.cl.contentPadding) {
            ForEach(sections) { section in
                MeditationDefaultSection(
                    sessions: section.sessions,
                    title: section.title,
                    viewAllTitle: "\(rainSessions.count) Sessions",
                    viewAllAction: {}
                )
            }
        }
        .padding(CGFloat.cl.contentPadding)
        .applyPrimaryDesign()
    }
    
    @ViewBuilder
    private func details(session: MeditationSession) -> some View {
        Rectangle()
            .fill(.clear)
            .background(.ultraThinMaterial)
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                VStack(spacing: 20) {
                    VStack(spacing: 10) {
                        Text(session.name)
                            .font(.h4)
                        Text("Sleep meditaion")
                            .font(.medium(weight: .regular))
                    }
                    
                    Button("Save") {}
                        .buttonStyle(.primaryButton())
                }
                .padding(CGFloat.cl.contentPadding)
                .padding(.bottom, 100)
            }

    }
}

#Preview {
    TabBarView()
}
