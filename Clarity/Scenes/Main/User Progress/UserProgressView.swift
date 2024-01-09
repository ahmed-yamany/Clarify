//
//  ProgressView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import SwiftUI

struct UserProgressView: View {
    @StateObject private var viewModel = ProgressViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: CGFloat.cl.contentPadding) {
                    progressTypePicker
                    progressCard
                }
                .padding(.horizontal, CGFloat.cl.contentPadding)
            }
            .applyPrimaryDesign()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Progress")
            .navigationBarTitleDisplayMode(.inline)
        }
      
    }
    
    private var progressTypePicker: some View {
        Picker(selection: $viewModel.progressType) {
            ForEach(ProgressType.allCases, id: \.hashValue) { type in
                Text(type.rawValue.capitalized)
                    .tag(type)
            }
        } label: {}
        .pickerStyle(.segmented)
        .onAppear {
            UISegmentedControl.appearance().selectedSegmentTintColor = .clPrimary
            UISegmentedControl.appearance().setDividerImage(UIImage(),
                                                            forLeftSegmentState: .normal,
                                                            rightSegmentState: .normal,
                                                            barMetrics: .default)
        }
    }
    
    private var progressCard: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.clInputField)
            .frame(height: 225)
    }
}

#Preview {
    TabBarView()
}
