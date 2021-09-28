//
//  TableViewCell.swift
//  MovieBrowser
//
//  Created by Mars on 9/25/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var movie: Movie?
    
    func updateLabels() {
        title.text = movie?.original_title
        releaseDate.text = movie?.release_date
        rating.text = String(movie!.vote_average!)
    }
}
