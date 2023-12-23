//
//  ClarityApp.swift
//  Clarity
//
//  Created by Ahmed Yamany on 20/12/2023.
//

import SwiftUI
import Combine

@main
struct ClarityApp: App {
    @StateObject private var appRouter = AppRouter.shared
    
    var body: some Scene {
        WindowGroup {
            AnyView(appRouter.rootView)
        }
    }
}
