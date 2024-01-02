//
//  ClarityApp.swift
//  Clarity
//
//  Created by Ahmed Yamany on 20/12/2023.
//

import SwiftUI
import Combine

enum TestEnum: Hashable {
    case next, next2
}

class TestNavigation: ObservableObject {
    @Published var routes: [TestEnum] = []
}

@main
struct ClarityApp: App {
    @StateObject private var appRouter = AppRouter.shared
    @StateObject var navigation = TestNavigation()
    @StateObject var appViewModel = AppViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            AnyView(appRouter.rootView)
        }
    }
}
