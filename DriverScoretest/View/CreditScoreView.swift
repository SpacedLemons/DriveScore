//
//  CreditScoreView.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import DesignSystem
import SwiftUI

struct CreditScoreView: View {
    @StateObject var viewModel: CreditScoreViewModel

    init(viewModel: CreditScoreViewModel? = nil) {
        let vm = viewModel ?? CreditScoreViewModel()
        _viewModel = StateObject(wrappedValue: vm)
    }

    var body: some View {
        switch viewModel.loadState {
        case .idle:
            Button(action: { Task { try await viewModel.getCreditScore() } }, label: {
                Text("Get Credit Score")
            })
            .accessibilityIdentifier("getCreditScoreButton")
            .buttonStyle(.primaryStyle())
        case .loading:
            ProgressView("Loading...")
                .accessibilityIdentifier("loadingIndicator")
        case .loaded(let score):
            DonutView(score: score)
                .id("donutViewContainer")
                .accessibilityIdentifier("donutView")
        case .failed(_):
            ErrorView().environmentObject(viewModel)
        }
    }
}

#Preview { CreditScoreView() }
