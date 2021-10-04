//
//  TableViewCell.swift
//  MovieBrowser
//
//  Created by Mars on 9/25/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

/// displays the cell

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var movie: Movie?
    
    /// sets all the text within the cell to the values within our model.
    
    func updateLabels() {
        
        /// IMPROVEMENT unwrap this first
        guard let movie = movie else {
            return
        }
        
        title.text = movie.original_title
        releaseDate.text = movie.release_date
        
        /// IMPROVEMENT nil Coaless the vote_average
        rating.text = String(movie.vote_average ?? 0)
    }
}
