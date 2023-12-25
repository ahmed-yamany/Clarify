//
//  SplashView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
        }
        .frame(maxHeight: .infinity, alignment: .center)
        .applyPrimaryDesign()
    }
}

#Preview {
    SplashView()
}
