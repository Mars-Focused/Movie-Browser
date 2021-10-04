//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

/// fetches the data from our API's and Images depending on the case

/// sets the outline or blueprint for our network service class
protocol NetworkServiceProtocol {
    func fetchMovies(query: String, completion: @escaping ([Movie]) -> Void)
    
    func fetchImage(imageStr: String, completion: @escaping (UIImage?) -> Void)
}

/// contains the functions that call the API weather image or JSON object
class NetworkService: NetworkServiceProtocol {
    
    func fetchMovies(query: String, completion: @escaping ([Movie]) -> Void) {

        let queryItems: [URLQueryItem] = [
            .init(name: "query", value: query),
        ]
        
        let request = URLRequestBuilder.buildRequest(path: .movie, method: .get, queryItems: queryItems)
        URLSession.shared.dataTask(with: request) { d, r, e in
            guard let d = d else {
                return
            }
            let decoder = JSONDecoder()
                do {
                    
                    
                    let results = try decoder.decode(Movielist.self, from: d)
                    
                    completion(results.results)

                } catch {}
            
        }.resume()
    }
    
    func fetchImage(imageStr: String, completion: @escaping (UIImage?) -> Void) {
        let imageBase = "https://image.tmdb.org/t/p/w500/"
        guard let imageURL = URL(string: imageBase + imageStr) else { fatalError() }
        
        URLSession.shared.dataTask(with: imageURL) { d, r, e in
            guard let d = d else { fatalError() }
            
            if let image = UIImage(data: d) {
                completion(image)
            }
        }.resume()
    }
    
}
