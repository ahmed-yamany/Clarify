//
//  SectionHeader.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    var viewAllTitle: String?
    var viewAllAction: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.XLarge(weight: .bold))
            Spacer()
            if let viewAllAction, let viewAllTitle {
                Button(viewAllTitle) {
                    viewAllAction()
                }
                .buttonStyle(.textPrimary)
            }
        }
        .textCase(.none)
    }
}
