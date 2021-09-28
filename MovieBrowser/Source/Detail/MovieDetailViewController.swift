//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    
    var detailsVM: DetailsViewModel?
    
    override func viewDidLoad() {
        configureDetails()
        movieImage.image = UIImage(named: "placeholder")
    }
    
    func configureDetails(){
        movieTitle.font = .systemFont(ofSize: 30)
        movieTitle.text = detailsVM?.movieTitle
        releaseDate.text = detailsVM?.releaseDate
        overview.text = detailsVM?.overview
        
        setImage()
    }
    
    func setImage() {
        let posterPath = detailsVM?.posterPath ?? ""
        detailsVM?.network.fetchImage(imageStr: posterPath) { image in
            DispatchQueue.main.async {
                self.movieImage.image = image
            }
        }
    }
    
}
