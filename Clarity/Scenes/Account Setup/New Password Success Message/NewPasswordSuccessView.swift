//
//  NewPasswordSuccessView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct NewPasswordSuccessView: View {
    @EnvironmentObject var navigation: OnboardingNavigation
    
    var body: some View {
        AccountSetupCustomView(subtitle: "") {
            VStack(spacing: 40) {
                Image(.newpasswordSucces)
                    .resizable()
                    .frame(width: 204, height: 192)
                
                VStack(spacing: 8) {
                    Text(L10n.AccountSetup.NewPassword.Success.title)
                        .font(.h4)
                    
                    Text(L10n.AccountSetup.NewPassword.Success.subtitle)
                        .font(.medium(weight: .regular))
                        .multilineTextAlignment(.center)
                }
                
                Button(L10n.AccountSetup.NewPassword.Success.button) {
                    navigation.pop(to: .signin)
                }
                .buttonStyle(.primaryButton())
            }
        }
    }
}

#Preview {
    NewPasswordSuccessView()
        .environmentObject(OnboardingNavigation())
}
