//
//  File.swift
//  
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

@available(iOS 15.0, *)
private struct TabBarBackgroundColorChanger: UIViewRepresentable {
    let color: Color
    init(_ color: Color) {
        self.color = color
    }
    func makeUIView(context: Context) -> some UIView { UIView() }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            uiView.parentViewController?.tabBarController?.tabBar.backgroundColor = UIColor(color)
        }
    }
}

@available(iOS 15.0, *)
extension View {
    @ViewBuilder
    func tabBarBackgroundColor(_ color: Color) -> some View {
        background {
            TabBarBackgroundColorChanger(color)
        }
    }
}
