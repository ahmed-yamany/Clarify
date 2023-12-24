//
//  Intro.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

enum IntroNavigationEnum: Hashable {
    case termsConditions, termsOfUse, privacyPolicy
}

final class IntroNavigation: ObservableObject {
    @Published var routes: [IntroNavigationEnum] = []
    
    func navigate(to route: IntroNavigationEnum) {
        routes.append(route)
    }
}

struct IntroView: View {
    @StateObject private var navigation = IntroNavigation()
    
    @State private var showNavigationView = false
    var body: some View {
        SplashView()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showNavigationView = true
                }
            }
            .fullScreenCover(isPresented: $showNavigationView) { navigationView }
    }
    
    private var navigationView: some View {
        NavigationStack(path: $navigation.routes) {
            PromoView(navigation: navigation)
                .navigationItemsBackButtonTitle("")
                .navigationDestination(for: IntroNavigationEnum.self) { route in
                    view(for: route)
                }
        }
        .tint(Color.clTextBody)
    }
    
    @ViewBuilder
    private func view(for route: IntroNavigationEnum) -> some View {
        switch route {
            case .termsConditions:
                TermsConditionsView(navigation: navigation)
            case .termsOfUse:
                Text("")
                    .applyPrimaryDesign()
                    .navigationTitle(L10n.Intro.Terms.Button.terms)
            case .privacyPolicy:
                Text("")
                    .applyPrimaryDesign()
                    .navigationTitle(L10n.Intro.Terms.Button.privacy)
        }
    }
}

#Preview {
    IntroView()
}
