//
//  URLComponents+Ext.swift
//  MovieBrowser
//
//  Created by Mars on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

/// setting the URLComponents to use the specific data we're working with.

extension URLComponents {
    
    /// declaring https as our URL scheme by default so we don't have to type it out every time as the app expands
    
    private static func defaultConfiguration(path: Paths) -> Self {
        var components = URLComponents()
        components.scheme = "https"
        components.path = path.rawValue
        return components
    }
    
    /// adds the query string to the url so that only paths within the queryItems dictionary may be called.
    
    static func buildURL(path: Paths, queryItems: [URLQueryItem]?) -> URL {
        var components: URLComponents = .defaultConfiguration(path: path)
        components.queryItems = queryItems
        guard let url = components.url else {
            fatalError("Coud not construct URL")
        }
        return url
    }
}

