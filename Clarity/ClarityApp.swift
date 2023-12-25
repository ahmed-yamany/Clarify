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
    
    var body: some Scene {
        WindowGroup {
            AnyView(appRouter.rootView)
//            NavigationStack(path: $navigation.routes) {
//                List {
//                    Button {
//                        navigation.routes.append(.next)
//                    } label: {
//                        Text("Click me")
//                    }
//                }
//                .navigationDestination(for: TestEnum.self) { route in
//                    switch route {
//                        case .next: Text("HI")
//                        case .next2: Text("HI 2")
//                    }
//                }
//                
//            }
        }
    }
}
