//
//  SigninView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: SigninViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SigninView()
        .environmentObject(Navigation())
        .environmentObject(SigninViewModel())
}
