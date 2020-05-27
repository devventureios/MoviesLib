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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let movie = movie {
            imageViewPoster.image = movie.poster
            labelTitle.text = movie.title
            if let categories = movie.categories as? Set<Category>, categories.count > 0 {
                labelCategories.text = categories.compactMap({$0.name}).joined(separator: " | ")
            } else {
                labelCategories.text = ""
            }
            labelDuration.text = movie.duration
            labelRating.text = movie.ratingFormatted
            textViewSummary.text = movie.summary
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieAdditionViewController {
            vc.movie = movie
        }
    }
}
