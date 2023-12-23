//
//  AppRouter.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI
import Combine

final class AppRouter: ObservableObject {
    public static let shared = AppRouter()
    private let userStoringManager = UserStoringManager.shared
    
    @Published public var rootView: any View = Text("")
        
    private init() {
        self.updateRootView()
    }

    public func login(_ user: User) {
        userStoringManager.save(user)
        updateRootView()
    }
   
    public func logout() {
        userStoringManager.deleteUser()
        updateRootView()
    }
    
    private func updateRootView() {
        if let _ = userStoringManager.getUser() {
            rootView = HomeView()
        } else {
            rootView = IntroView()
        }
    }
}
