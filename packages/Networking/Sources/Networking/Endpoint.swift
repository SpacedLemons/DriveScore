//
//  Endpoint.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation

public class Endpoint {
    struct API {
        var scheme: String
        var host: String
        var path: String

        public init(scheme: String, host: String, path: String) {
            self.scheme = scheme
            self.host = host
            self.path = path
        }

        public init(url: URL) {
            self.scheme = url.scheme ?? "file"
            self.host = url.host ?? ""
            self.path = url.path
        }
    }

    var api: API

    init(api: API) { self.api = api }

    public func makeRequestComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = api.scheme
        components.host = api.host
        components.path = api.path
        return components
    }
}

public enum Endpoints {
    case creditValues

    public func getEndpoint() -> Endpoint {
        Endpoint(
            api: Endpoint.API(
                scheme: "https",
                host: "android-interview.s3.eu-west-2.amazonaws.com",
                path: "/endpoint.json"
            )
        )
    }
}
