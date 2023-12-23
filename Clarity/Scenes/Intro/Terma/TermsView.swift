//
//  TermsView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

struct TermsView: View {
    @ObservedObject var navigation: IntroNavigation
    
    var body: some View {
        VStack {
        }
        .applyPrimaryDesign()
    }
}

#Preview {
    TermsView(navigation: .init())
}
