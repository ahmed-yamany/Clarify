//
//  AsyncImageStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

/// Configuration model for AsyncImageStyle.
struct AsyncImageConfigurations {
    let url: URL?
}

/// Protocol defining the structure for styles applied to AsyncImage views.
protocol AsyncImageStyle: DynamicProperty {
    associatedtype Body: View
    typealias Configurations = AsyncImageConfigurations
    
    /// Creates the body of the view based on the provided configurations.
    ///
    /// - Parameter configurations: The configuration model.
    /// - Returns: The body of the view.
    @ViewBuilder func makeBody(configurations: Configurations) -> Body
}

/// Default implementation of AsyncImageStyle.
struct DefaultAsyncImageStyle: AsyncImageStyle {
    func makeBody(configurations: Configurations) -> some View {
        AsyncImage(url: configurations.url) { phase in
            if let image = phase.image {
                image
                    .resizable()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

/// Environment key for setting the default value of AsyncImageStyle.
struct AsyncImageKey: EnvironmentKey {
    static var defaultValue: any AsyncImageStyle = DefaultAsyncImageStyle()
}

extension EnvironmentValues {
    /// Property to access or set the current value for the asyncImageStyle environment key.
    var asyncImageStyle: any AsyncImageStyle {
        get { self[AsyncImageKey.self] }
        set { self[AsyncImageKey.self] = newValue}
    }
}

extension View {
    /// Applies a custom AsyncImageStyle to the view.
    ///
    /// - Parameter style: The custom AsyncImageStyle.
    /// - Returns: A modified view with the specified AsyncImageStyle applied.
    @ViewBuilder
    func asyncImageStyle(_ style: any AsyncImageStyle) -> some View {
        environment(\.asyncImageStyle, style)
    }
}
