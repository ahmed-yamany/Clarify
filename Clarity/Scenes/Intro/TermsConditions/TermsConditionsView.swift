//
//  TermsView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

struct TermsConditionsView: View {
    @ObservedObject var navigation: IntroNavigation
    @StateObject private var viewModel = TermsConditionsViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 68) {
            title
            terms
            footerView
        }
        .padding([.horizontal, .top], .cl.contentPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .applyPrimaryDesign()
    }
    
    private var title: some View {
        Text(L10n.Intro.Terms.title)
            .font(Font.h4)
    }
    
    private var terms: some View {
        VStack(alignment: .leading, spacing: 28) {
            Toggle(isOn: $viewModel.agreeToTerms) {
                Group {
                    Text(L10n.Intro.Terms.Toggle.terms)
                    privacyButton
                    Text("&")
                    termsButton
                }
            }
            
            Toggle(isOn: $viewModel.agreeToHealthData) {
                VStack(alignment: .leading) {
                    Text(L10n.Intro.Terms.Toggle.healthData)
                      
                    privacyButton
                        .padding(.horizontal, 12)
                }
            }
            
            Toggle(isOn: $viewModel.agreeToMarketing) {
                Text(L10n.Intro.Terms.Toggle.markting)
            }
        }
        .toggleStyle(.primary)
    }
    
    private var footerView: some View {
        VStack(spacing: 12) {
            Button(L10n.Intro.Terms.Button.acceptAll) {}
                .buttonStyle(.primaryButton())
            
            Button(L10n.Intro.Terms.Button.signup) {}
                .buttonStyle(.secondaryButton())
        }
    }
    
    private var privacyButton: some View {
        Button(L10n.Intro.Terms.Button.privacy) {
            navigation.navigate(to: .privacyPolicy)
        }
        .padding(.horizontal, -12)
        .buttonStyle(.textPrimary)
    }
    
    private var termsButton: some View {
        Button(L10n.Intro.Terms.Button.terms) {
            navigation.navigate(to: .termsOfUse)
        }
        .padding(.horizontal, -12)
        .buttonStyle(.textPrimary)
    }
}

#Preview {
    TermsConditionsView(navigation: .init())
}
