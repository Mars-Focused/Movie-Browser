//
//  MoviesViewModel.swift
//  MovieBrowser
//
//  Created by Mars on 9/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var network: NetworkServiceProtocol
    var updateUI: (() -> Void)?
    
    init() {
        network = NetworkService()
    }
    
    func fetchMovies(query: String) {
        network.fetchMovies(query: query) { movies in
            self.movies = movies
        }
    }
    
    func bind(completion: @escaping () -> Void) {
        self.updateUI = completion
    }
}
