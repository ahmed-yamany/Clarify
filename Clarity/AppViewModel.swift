//
//  AppViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

class AppViewModel: ObservableObject {
    public static let shared = AppViewModel()
    
    @Published var colorSceme: ColorScheme = .dark
    
    private init() {}
}
