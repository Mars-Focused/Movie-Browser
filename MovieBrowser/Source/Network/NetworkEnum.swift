//
//  NetworkEnum.swift
//  MovieBrowser
//
//  Created by Mars on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

/// holds the pieces of our acceptable API calls
/// sets it to an enum type
/// an enum is like a switch statement in javascript

enum AppSecrets: String {
    case APIKey = "5885c445eab51c7004916b9c0313e2d3"
}

enum Paths: String {
    case image = "/image.tmdb.org/t/p/w500/"
    case movie = "/api.themoviedb.org/3/search/movie"
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
