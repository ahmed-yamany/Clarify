//
//  HomeView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var navigation = Navigation()
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack(path: $navigation.routes) {
            ScrollView {
                
            }
            .applyPrimaryDesign()
            .navigationDestination(for: NavigationEnum.self) { route in
                route.view()
                    .environmentObject(navigation)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    TabBarView()
}
