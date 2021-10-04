//
//  MoviesViewModel.swift
//  MovieBrowser
//
//  Created by Mars on 9/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

/// Holds the data for the MovieList Model, and instructs the view to update whenever that data changes
/// ensuring that our app is immediatly responsive

class MoviesViewModel {
    
    /// didSet: Checks if the variable before it has changed, and executes the code block after when it does.
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var network: NetworkServiceProtocol
    var updateUI: (() -> Void)?
    
    /// initializes the network object
    
    init() {
        network = NetworkService()
    }
    
    /// updates the movies object
    
    func fetchMovies(query: String) {
        network.fetchMovies(query: query) { movies in
            self.movies = movies
        }
    }
    
    /// updates the View
    
    func bind(completion: @escaping () -> Void) {
        self.updateUI = completion
    }
}
