//
//  DiscoverView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import SwiftUI

enum DiscoverNavigationEnum: String, Hashable {
    case searchResule
    
    @ViewBuilder
    func view() -> some View {
        switch self {
            case .searchResule: Text("")
        }
    }
}

class DiscoverNavigation: Navigation<DiscoverNavigationEnum> {}

struct DiscoverView: View {
    @StateObject private var navigation = DiscoverNavigation()
    @StateObject private var viewModel = DiscoverViewModel()
    
    @State private var meditationTypes: [MeditationType] = []
    
    var body: some View {
        NavigationStack(path: $navigation.routes) {
            contentView
                .navigationItemBackButtonTitle("")
                .navigationDestination(for: DiscoverNavigationEnum.self) { route in
                    route.view()
                        .navigationItemBackButtonTitle("")
                        .environmentObject(navigation)
                        .environmentObject(viewModel)
                }
        }
        .tint(.clTextBody)
        .task {
            do {
                meditationTypes = try await viewModel.getMeditationTypes()
            } catch {}
        }
    }
    
    var contentView: some View {
        ScrollView {
            VStack(spacing: 62) {
                SearchTextField(title: "What do you want to listen?", text: $viewModel.search)
                    .submitLabel(.search)
                    .onSubmit {
                        submitSearch()
                    }
                if meditationTypes.isEmpty {
                    VStack(spacing: 32) {
                        Image(.assetSearchEmpty)
                        VStack {
                            Text("We're sorry")
                                .font(.h4)
                            Text("We can't fined anything")
                                .font(.medium(weight: .semibold))
                        }
                    }
                } else {
                    MeditationTypeSection(title: "Browse all", types: meditationTypes)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .applyPrimaryDesign()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) { Text("") }
        }
    }
    
    private func submitSearch() {
        Task {
            meditationTypes = try await viewModel.submitSearch()
        }
    }
}

#Preview {
    TabBarView()
}
