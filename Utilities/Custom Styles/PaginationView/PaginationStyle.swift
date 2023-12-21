//
//  PaginationStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct PaginationConfigurations {
    let currentIndex: Int
    let selectedIndex: Int
}

protocol PaginationStyle: DynamicProperty {
    associatedtype Body: View
    typealias Configurations = PaginationConfigurations
    
    @ViewBuilder
    func makeBody(configurations: Configurations) -> Body
}

struct PaginationKey: EnvironmentKey {
    static var defaultValue: any PaginationStyle = CirclePaginationStyle()
}

extension EnvironmentValues {
    var paginationStyle: any PaginationStyle {
        get { self[PaginationKey.self] }
        set { self[PaginationKey.self] = newValue }
    }
}

extension View {
    func paginationStyle(_ style: any PaginationStyle) -> some View {
        environment(\.paginationStyle, style)
    }
}

struct ResovedPaginationStyle<Style: PaginationStyle>: View {
    var configurations: Style.Configurations
    var style: Style
    
    var body: some View {
        style.makeBody(configurations: configurations)
    }
}

extension PaginationStyle {
    func resolve(configurations: Configurations) -> some View {
        ResovedPaginationStyle(configurations: configurations, style: self)
    }
}

struct PaginationSelectTintColorKey: EnvironmentKey {
    static var defaultValue: Color = .blue
}

struct PaginationTintColorKey: EnvironmentKey {
    static var defaultValue: Color = .gray
}

extension EnvironmentValues {
    var paginationSelectTint: Color {
        get { self[PaginationSelectTintColorKey.self] }
        set { self[PaginationSelectTintColorKey.self] = newValue }
    }
    
    var paginationTint: Color {
        get { self[PaginationTintColorKey.self] }
        set { self[PaginationTintColorKey.self] = newValue }
    }
}

extension View {
    func paginationSelectTint(_ color: Color) -> some View {
        environment(\.paginationSelectTint, color)
    }
    func paginationTint(_ color: Color) -> some View {
        environment(\.paginationTint, color)
    }
}
