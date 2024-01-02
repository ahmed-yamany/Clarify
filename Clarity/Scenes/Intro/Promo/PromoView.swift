//
//  PromoView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

// View that displays promotional content in the introductory section
struct PromoView: View {
    @ObservedObject var navigation: OnboardingNavigation
    @StateObject private var viewModel: PromoViewModel = .init()
    
    private let spacing: CGFloat = 24 // Spacing constant for the view layout
    
    var body: some View {
        VStack(spacing: spacing) {
            VStack(spacing: 8) {
                tabView // Tab view for navigating through promos
                Spacer()
                pagination // Pagination control for the tab view
            }
            .frame(height: CGFloat.screenSize.height * 0.75)
            
            nextButton // Button to proceed to the next step
            
            signinButton // Button for signing in
        }
        .animation(.linear, value: viewModel.selectedPromoIndex)
        .padding(.horizontal, CGFloat.cl.contentPadding)
        .applyPrimaryDesign() // Applies primary design to the view
        .task { // Asynchronous task to load promotional content
            do {
                viewModel.promos = try await viewModel.getPromos()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // View for the tab view that displays promos
    var tabView: some View {
        TabView(selection: $viewModel.selectedPromoIndex) {
            ForEach(viewModel.promos.indices, id: \.self) { index in
                let promo = viewModel.promos[index]
               tabViewCell(promo, index: index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding(.horizontal, -CGFloat.cl.contentPadding)
        .padding(.top, 8)

    }
    
    // Function to create a view for each promo tab
    func tabViewCell(_ promo: Promo, index: Int) -> some View {
        VStack(spacing: spacing) {
            PromoImage(resource: promo.imageResource)
            
            VStack(spacing: 8) {
                Text(promo.title)
                    .font(Font.h6)
                Text(promo.subtitle)
                    .multilineTextAlignment(.center)
                    .frame(width: CGFloat.screenSize.width / 2)
            }
        }
        .padding(.horizontal)
        .tag(index)
    }
    
    // Pagination view for the promo content
    private var pagination: some View {
        PaginationView(count: viewModel.promos.count, selectedIndex: viewModel.selectedPromoIndex)
            .paginationStyle(.capsule)
            .paginationTint(Color.clInputIcon)
            .paginationSelectTint(Color.clPrimary)
    }
    
    private var nextButton: some View {
        Button(L10n.Intro.Promo.Button.next) {
            viewModel.promoMove {
                navigation.navigate(to: .termsConditions)
            }
        }
        .buttonStyle(.primaryButton())
    }
    
    private var signinButton: some View {
        Button(L10n.Intro.Promo.Button.signin) {
            navigation.navigate(to: .signin)
        }
        .buttonStyle(.textSecondary)
    }
}

#Preview {
    IntroView()
}
