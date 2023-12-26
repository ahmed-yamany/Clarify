//
//  File.swift
//  
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

@available(iOS 15.0, *)
private struct NavigationTitleChanger: UIViewRepresentable {
    let title: String
    let color: UIColor
    let font: UIFont
    
    func makeUIView(context: Context) -> some UIView { UIView() }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = color
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            uiView.parentViewController?.navigationItem.titleView = label
        }
    }
}

@available(iOS 15.0, *)
public extension View {
    @ViewBuilder
    func navigationItemTitle(_ title: String,
                             color: UIColor = .tintColor,
                             font: UIFont = .systemFont(ofSize: UIFont.labelFontSize, weight: .bold)) -> some View {
        background {
            NavigationTitleChanger(title: title, color: color, font: font)
        }
    }
}
