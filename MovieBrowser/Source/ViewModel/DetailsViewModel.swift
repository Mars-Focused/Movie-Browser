//
//  DetailsViewModel.swift
//  MovieBrowser
//
//  Created by Mars on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

/// Holds the data for a Movie model and instructs the view to conform to it.

class DetailsViewModel {
    
    var movie: Movie
    var network: NetworkServiceProtocol
    
    /// instantiates a movie with a movie and network
    
    init(movie: Movie) {
        self.movie = movie
        self.network = NetworkService()
    }
    
    /// fetches the image from the network
    
    func fetchImage(imageStr: String ,completion: @escaping (UIImage?) -> Void) {
        network.fetchImage(imageStr: imageStr, completion: completion)
    }
    
    /// sets these variables to their value within the Movie model
    
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
