//
//  SignupView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: SignupViewModel
    
    var body: some View {
        Text("Hello World")
    }
}

#Preview {
    SignupView()
        .environmentObject(Navigation())
        .environmentObject(SignupViewModel())
}
