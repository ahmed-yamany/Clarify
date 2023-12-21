//
//  PromoAsyncImage.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct PromoAsyncImage: View {
    var url: URL?
    @Environment(\.asyncImageStyle) var imageStyle
    
    var body: some View {
        AnyView(imageStyle.makeBody(configurations: .init(url: url)))
            .frame(height: CGFloat.screenSize.height * 0.55)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
