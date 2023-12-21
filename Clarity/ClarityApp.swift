//
//  ClarityApp.swift
//  Clarity
//
//  Created by Ahmed Yamany on 20/12/2023.
//

import SwiftUI

@main
struct ClarityApp: App {
    @Environment(\.colorScheme) var systemColorSceme
    @ObservedObject var appViewModel = AppViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            PromoView()
//                .environment(\.colorScheme, appViewModel.colorSceme)
        }
    }
}
