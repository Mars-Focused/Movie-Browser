//
//  URLComponents+Ext.swift
//  MovieBrowser
//
//  Created by Mars on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

extension URLComponents {
    private static func defaultConfiguration(path: Paths) -> Self {
        var components = URLComponents()
        components.scheme = "https"
        components.path = path.rawValue
        return components
    }
    
    static func buildURL(path: Paths, queryItems: [URLQueryItem]?) -> URL {
        var components: URLComponents = .defaultConfiguration(path: path)
        components.queryItems = queryItems
        guard let url = components.url else {
            fatalError("Coud not construct URL")
        }
        return url
    }
}

