//
//  TermsView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

// View for displaying terms and conditions in the introductory section
struct TermsConditionsView: View {
    @EnvironmentObject var navigation: Navigation
    
    @StateObject private var viewModel = TermsConditionsViewModel()
    @State private var accountSetupIsPresended = false // State to control the presentation of the account setup view
    
    var body: some View {
        VStack(alignment: .leading, spacing: 68) {
            title // Title of the terms and conditions view
            terms // Toggles for various terms
            footerView // Footer containing buttons for actions
        }
        .padding([.horizontal, .top], .cl.contentPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .applyPrimaryDesign()
        .fullScreenCover(isPresented: $accountSetupIsPresended) {
            AccountSetupView(termsAndConditionViewModel: viewModel)
        }
    }
    
    // Title view for terms and conditions
    private var title: some View {
        Text(L10n.Intro.Terms.title)
            .font(Font.h4)
    }
    
    // View containing toggles for agreeing to different terms
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
        .toggleStyle(.primary) // Style for the toggles
    }
    
    // Footer view containing buttons for accepting terms or signing up
    private var footerView: some View {
        VStack(spacing: 12) {
            Button(L10n.Intro.Terms.Button.acceptAll) {
                // Actions to agree to all terms
                viewModel.agreeToTerms = true
                viewModel.agreeToMarketing = true
                viewModel.agreeToHealthData = true
            }
            .buttonStyle(.primaryButton())
            
            Button(L10n.Intro.Terms.Button.signup) {
                accountSetupIsPresended = true  // Action to present the signup view
            }
            .buttonStyle(.secondaryButton())
        }
    }
    
    // Button for navigating to the privacy policy
    private var privacyButton: some View {
        Button(L10n.Intro.Terms.Button.privacy) {
            navigation.navigate(to: .privacyPolicy)
        }
        .padding(.horizontal, -12)
        .buttonStyle(.textPrimary)
    }
    
    // Button for navigating to the terms of use
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
