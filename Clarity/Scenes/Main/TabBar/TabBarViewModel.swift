//
//  TabBarViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

enum TabBarTypes: String, CaseIterable, Hashable {
    case home, discover, progress, settings
    
    @ViewBuilder
    func body(viewModel: TabBarViewModel, currentTab: TabBarTypes) -> some View {
        view
        .tag(self)
        .tabItem {
            Label(currentTab.rawValue.capitalized,
                  image: viewModel.selectedTab == currentTab ? currentTab.imageSelected : currentTab.image)
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
            case .home: HomeView()
            case .discover: DiscoverView()
            default:
                NavigationStack {
                    ScrollView {
                        Text("Hello \(self.rawValue)")
                    }
                    .applyPrimaryDesign()
                    .navigationTitle("Home")
                }
        }
    }
    
    var image: String { "tabBar-\(self.rawValue)"}
    var imageSelected: String { "tabBar-\(self.rawValue)-selected"}
    
}

class TabBarViewModel: ObservableObject {
    static let shared = TabBarViewModel()
    
    @Published var selectedTab: TabBarTypes = .discover
}
