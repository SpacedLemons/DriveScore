//
//  Networkable.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation

protocol Networkable {
    func fetch<T: Decodable>(
        from endpoint: Endpoint,
        method: HTTPMethod,
        session: URLSessionProtocol,
        body: Data?,
        decoder: JSONDecoder
    ) async throws -> T
}

extension Networkable {
    func fetch<T: Decodable>(
        from endpoint: Endpoint,
        method: HTTPMethod = .get,
        session: URLSessionProtocol,
        body: Data? = nil,
        decoder: JSONDecoder = JSONDecoder()
    ) async throws -> T {
        let requestComponents = endpoint.makeRequestComponents()

        guard let url = requestComponents.url else { throw NetworkingError.url }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw NetworkingError.network
        }

        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw NetworkingError.network
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkingError.parsing
        }
    }
}
