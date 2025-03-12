//
//  CreditFetcher.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation

public protocol CreditFetchable {
    func getCreditScore() async throws -> CreditAccount
}

public class CreditFetcher {
    public let session: URLSessionProtocol
    private let endpoint: Endpoint

    public init(session: URLSessionProtocol = URLSession.shared, endpoint: Endpoint) {
        self.session = session
        self.endpoint = endpoint
    }
}

extension CreditFetcher: CreditFetchable, Networkable {
    public func getCreditScore() async throws -> CreditAccount {
        try await fetch(
            from: endpoint,
            method: .get,
            session: self.session,
            body: nil,
            decoder: JSONDecoder()
        )
    }
}
