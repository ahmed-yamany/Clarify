//
//  SearchTextField.swift
//  Clarity
//
//  Created by Ahmed Yamany on 01/01/2024.
//

import SwiftUI

struct SearchFilterAction: EnvironmentKey {
    static var defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var searchFilterAction: () -> Void {
        get { self[SearchFilterAction.self] }
        set { self[SearchFilterAction.self] = newValue }
    }
}
extension View {
    @ViewBuilder
    func searchFilterAction(_ action: @escaping () -> Void) -> some View {
        environment(\.searchFilterAction, action)
    }
}

struct SearchTextField: View {
    let title: String
    @Binding var text: String
        
    @Environment(\.searchFilterAction) private var searchFilterAction
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.custom(size: 16, weight: .regular))
            
            TextField("", text: $text, prompt: Text(title).foregroundColor(Color.clInputLabel))
                .frame(height: 40)
                
            Button {
                searchFilterAction()
            } label: {
                Image(.iconFilter)
                    .font(.custom(size: 16, weight: .regular))
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 8)
        .frame(width: CGFloat.screenSize.width / 1.3 )
        .background(Color.clInputField)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .font(.medium(weight: .regular))
    }
}
