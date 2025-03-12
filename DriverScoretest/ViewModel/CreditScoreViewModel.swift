//
//  CreditScoreViewModel.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation
import Networking

enum LoadState: Equatable {
    case idle
    case loading
    case loaded(Score)
    case failed(NetworkingError)
}

@MainActor
final class CreditScoreViewModel: ObservableObject {
    @Published var loadState: LoadState = .idle
    private let fetcher: CreditFetchable
    private let testService: UITestServiceProtocol

    init(
        fetcher: CreditFetchable = CreditFetcher(endpoint: Endpoints.creditValues.getEndpoint()),
        testService: UITestServiceProtocol = UITestService()
    ) {
        self.fetcher = fetcher
        self.testService = testService

        if let initialState = testService.initialLoadState {
            self.loadState = initialState
        }
    }

    func getCreditScore() async throws {
        if testService.isUITesting && testService.initialLoadState != nil { return }

        loadState = .loading
        do {
            let response = try await fetcher.getCreditScore()
            let newScore = Score(
                score: response.creditReportInfo.score,
                maxScore: response.creditReportInfo.maxScoreValue
            )
            loadState = .loaded(newScore)
        } catch let error as NetworkingError {
            loadState = .failed(error)
        } catch {
            loadState = .failed(.unknown)
        }
    }
}
