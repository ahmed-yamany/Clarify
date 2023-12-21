//
//  PromoView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct PromoView: View {
    @StateObject private var viewModel = PromoViewModel()    
    private let spacing: CGFloat = 28
    
    var body: some View {
        VStack(spacing: spacing) {
            VStack(spacing: 8) {
                tabView
                Spacer()
               pagination
            }
            .frame(height: CGFloat.screenSize.height * 0.75)
            
            nextButton
            signinButton
            
            Spacer()
        }
        .animation(.linear, value: viewModel.selectedPromoIndex)
        .padding(.horizontal, CGFloat.cl.contentPadding)
        .applyPrimaryDesign()
        .task {
            do {
                viewModel.promos = try await viewModel.getPromos()
            } catch {
            }
        }
    }
    
    var tabView: some View {
        TabView(selection: $viewModel.selectedPromoIndex) {
            ForEach(viewModel.promos.indices, id: \.self) { index in
                let promo = viewModel.promos[index]
               tabViewCell(promo, index: index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding(.horizontal, -CGFloat.cl.contentPadding)

    }
    
    func tabViewCell(_ promo: Promo, index: Int) -> some View {
        VStack(spacing: spacing) {
            PromoAsyncImage(url: promo.imageUrl)
            
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
    
    private var pagination: some View {
        PaginationView(count: viewModel.promos.count, selectedIndex: viewModel.selectedPromoIndex)
            .paginationStyle(.capsule)
            .paginationTint(Color.clInputIcon)
            .paginationSelectTint(Color.clPrimary)
    }
    
    private var nextButton: some View {
        Button(L10n.Intro.Promo.Button.next) {
            viewModel.promoMove()
        }
        .buttonStyle(.primaryButton())
    }
    
    private var signinButton: some View {
        Button(L10n.Intro.Promo.Button.signin) {
            
        }
        .buttonStyle(.textSecondary)
    }
}

#Preview {
    PromoView()
}
