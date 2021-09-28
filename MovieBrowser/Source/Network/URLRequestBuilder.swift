//
//  URLRequestBuilder.swift
//  MovieBrowser
//
//  Created by Mars on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct URLRequestBuilder {
    static func buildRequest(path: Paths, method: HTTPMethods, queryItems: [URLQueryItem]? = nil, body: [String: AnyHashable]? = nil) -> URLRequest {
        let defaultQueryItems: [URLQueryItem] = [
            .init(name: "api_key", value: AppSecrets.APIKey.rawValue),
            .init(name: "language", value: "en"),
            .init(name: "page", value: "1"),
            .init(name: "include_adult", value: "false"),
        ]
        let fullQueryItems = defaultQueryItems + (queryItems ?? [])
        
        var req = URLRequest(
            url: URLComponents.buildURL(
                path: path,
                queryItems: fullQueryItems
            )
        )
        req.httpMethod = method.rawValue
        return req
    }
    
}
