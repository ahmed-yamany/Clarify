//
//  VerifyAccountview.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct VerifyAccountview: View {
    @EnvironmentObject var navigation: AccountSetupNavigation
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    VerifyAccountview()
        .environmentObject(AccountSetupNavigation())
}
