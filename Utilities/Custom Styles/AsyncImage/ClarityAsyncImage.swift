//
//  ClarityAsyncImage.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import SwiftUI

struct ClarityAsyncImage: View {
    var url: URL?
    @Environment(\.asyncImageStyle) var imageStyle
    
    var body: some View {
        AnyView(imageStyle.makeBody(configurations: .init(url: url)))
    }
}
