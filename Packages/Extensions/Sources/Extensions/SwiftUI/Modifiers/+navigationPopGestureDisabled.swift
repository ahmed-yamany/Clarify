//
//  File.swift
//  
//
//  Created by Ahmed Yamany on 22/12/2023.
//

import SwiftUI

/// A SwiftUI `UIViewRepresentable` structure for controlling the interactive pop gesture in a navigation controller.
@available(iOS 15.0, *)
private struct NavigationPopGestureDisabler: UIViewRepresentable {
    /// A boolean value indicating whether to disable the interactive pop gesture (`true`) or enable it (`false`).
    let disabled: Bool
    
    func makeUIView(context: Context) -> some UIView { UIView() }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            uiView
                .parentViewController?
                .navigationController?
                .interactivePopGestureRecognizer?.isEnabled = !disabled
        }
    }
}

@available(iOS 15.0, *)
public extension View {
    /// Disables or enables the interactive pop gesture in a navigation controller.
    ///
    /// - Parameter disabled: A boolean value indicating whether to disable (`true`) or enable (`false`) the gesture.
    /// - Returns: A view modified to control the interactive pop gesture.
    @ViewBuilder
    func navigationPopGestureDisabled(_ disabled: Bool) -> some View {
        background {
            NavigationPopGestureDisabler(disabled: disabled)
        }
    }
}
