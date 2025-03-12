//
//  URLSession.swift
//  Networking
//
//  Created by Lucas West on 03/03/2025.
//

import Foundation

public protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
