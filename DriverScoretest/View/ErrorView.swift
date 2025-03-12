//
//  ErrorView.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import DesignSystem
import SwiftUI

struct ErrorView: View {
    @EnvironmentObject private var viewModel: CreditScoreViewModel

    var body: some View {
        VStack(spacing: 16) {
            if case let .failed(error) = viewModel.loadState {
                Text(error.localizedDescription)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .accessibilityIdentifier("errorMessage")
            }
            Button(action: { Task { try await viewModel.getCreditScore() } }, label: {
                Text("Retry")
            })
            .accessibilityIdentifier("retryButton")
            .buttonStyle(.primaryStyle())
            Button(action: { viewModel.loadState = .idle }, label: {
                Text("Cancel")
            })
            .accessibilityIdentifier("cancelButton")
            .buttonStyle(.cancelStyle())
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview { ErrorView() }
