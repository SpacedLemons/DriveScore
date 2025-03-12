//
//  MockURLSession.swift
//  Networking
//
//  Created by Lucas West-Rogers on 02/03/2025.
//

import Foundation
import Networking

public class MockURLSession: URLSessionProtocol {
    public var data: Data?
    public var response: URLResponse?
    public var error: Error?

    public init() {}

    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error { throw error }
        guard let data, let response else { throw URLError(.badServerResponse) }
        return (data, response)
    }
}
