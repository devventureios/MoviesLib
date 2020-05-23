//
//  MovieViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 20/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

//Controle de acesso
//private
//fileprivate
//internal
//public
//open


import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var labelURL: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Justo for Ygor!!
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController?.setNavigationBarHidden(true, animated: true)
        
        if let movie = movie {
            imageViewPoster.image = UIImage(named: movie.image)
            labelTitle.text = movie.title
            labelCategories.text = movie.categories
            labelDuration.text = movie.duration
            labelRating.text = movie.ratingFormatted
            textViewSummary.text = movie.summary
        }
    }
}
