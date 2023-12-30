//
//  TabBarView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = TabBarViewModel.shared
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            ForEach(TabBarTypes.allCases, id: \.hashValue) { tabBarType in
                tabBarType.body(viewModel: viewModel, currentTab: tabBarType)
            }
            .tabBarBackgroundColor(Color.clInputField.opacity(0.5))
        }
        .tint(Color.clOtherSecondaryToPrimary)
    }
}

#Preview {
    TabBarView()
}
