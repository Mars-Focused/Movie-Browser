//
//  MovieModel.swift
//  MovieBrowser
//
//  Created by Mars on 9/24/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

/// we create a structure of movie to make our app a) easier to read and b) to easily connect to the JSON object

import Foundation

struct Movielist: Decodable {
    var results: [Movie]
    
}

struct Movie: Decodable {
    let original_title: String?
    let vote_average: Double?
    let release_date: String?
    let overview: String?
    let poster_path: String?
}
