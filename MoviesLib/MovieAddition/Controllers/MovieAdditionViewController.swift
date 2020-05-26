//
//  MovieAdditionViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 25/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

class MovieAdditionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldRating: UITextField!
    @IBOutlet weak var textFieldDuration: UITextField!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    // MARK: - Properties
    var movie: Movie!
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if movie != nil {
            title = "Edição"
            textFieldTitle.text = movie.title
            textFieldRating.text = "\(movie.rating)"
            textFieldDuration.text = movie.duration
            textViewSummary.text = movie.summary
            imageViewPoster.image = movie.poster
            //Categorias
            buttonAddEdit.setTitle("Alterar", for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func selectImage(_ sender: UIButton) {
    }
    
    @IBAction func addUpdateMovie(_ sender: UIButton) {
        if movie == nil {
            movie = Movie(context: context)
        }
        movie.title = textFieldTitle.text
        movie.duration = textFieldDuration.text
        movie.summary = textViewSummary.text
        let rating = Double(textFieldRating.text!) ?? 0
        //movie.rating = max(min(rating, 10), 0)
        movie.rating = rating
        movie.image = imageViewPoster.image?.jpegData(compressionQuality: 0.8)
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error)
        }
    }
    
    // MARK: - Methods
    
}
