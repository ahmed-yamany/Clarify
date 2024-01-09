//
//  ProgressViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import SwiftUI

enum ProgressType: String, Hashable, CaseIterable {
    case day, week, month
}

class ProgressViewModel: ObservableObject {
    @Published var  progressType: ProgressType = .day
}
