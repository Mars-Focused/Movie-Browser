//
//  DetailsViewModel.swift
//  MovieBrowser
//
//  Created by Mars on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class DetailsViewModel {
    
    var movie: Movie
    var network: NetworkServiceProtocol
    
    init(movie: Movie) {
        self.movie = movie
        self.network = NetworkService()
    }
    
    func fetchImage(imageStr: String ,completion: @escaping (UIImage?) -> Void) {
        network.fetchImage(imageStr: imageStr, completion: completion)
    }
    
    var movieTitle: String {
        movie.original_title ?? "Placeholder Title"
    }
    
    var releaseDate: String {
        movie.release_date ?? "Placeholder Date"
    }
    
    var rating: String {
        String(movie.vote_average ?? 0)
    }
    
    var overview: String {
        movie.overview ?? "Placeholder Overview"
    }
    
    var posterPath: String {
        movie.poster_path ?? "Placeholder Poster Path"
    }
    
}
