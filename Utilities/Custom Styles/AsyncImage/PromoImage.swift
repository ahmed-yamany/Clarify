//
//  PromoAsyncImage.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct PromoAsyncImage: View {
    var url: URL?
    
    var body: some View {
        ClarityAsyncImage(url: url)
            .frame(height: CGFloat.screenSize.height * 0.55)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct PromoImage: View {
    let resource: ImageResource

    init(resource: ImageResource) {
        self.resource = resource
    }
    var body: some View {
        Image(resource)
            .resizable()
            .frame(height: CGFloat.screenSize.height * 0.55)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
