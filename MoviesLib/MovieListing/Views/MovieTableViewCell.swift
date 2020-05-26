//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 23/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    func configure(with movie: Movie) {
        imageViewPoster.image = movie.poster
        labelTitle.text = movie.title
        labelSummary.text = movie.summary
        labelRating.text = movie.ratingFormatted
    }
}
