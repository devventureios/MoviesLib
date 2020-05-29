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
import AVKit

class MovieViewController: UIViewController {

    @IBOutlet weak var labelURL: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var viewMovieContainer: UIView!
    
    var movie: Movie?
    var trailer: String = ""
    var moviePlayer: AVPlayer?
    var moviePlayerController: AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Justo for Ygor!!
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController?.setNavigationBarHidden(true, animated: true)
        if let title = movie?.title {
            loadTrailer(with: title)
        }
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
    
    //MARK: - IBActions
    @IBAction func play(_ sender: UIButton) {
        playMovie()
    }
    
    //MARK: - Methods
    private func loadTrailer(with title: String) {
        struct APIResult: Codable {
            let results: [Trailer]
        }
        struct Trailer: Codable {
            let previewUrl: String
        }
        let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: "https://itunes.apple.com/search?media=movie&entity=movie&term=\(encodedTitle)")
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            let apiResult = try! JSONDecoder().decode(APIResult.self, from: data!)
            self.trailer = apiResult.results.first!.previewUrl
            DispatchQueue.main.async {
                self.prepareVideo()
                if UserDefaults.standard.bool(forKey: Key.autoplay) {
                        self.playMovie()
                }
            }
        }.resume()
    }
    
    private func prepareVideo() {
        guard let url = URL(string: trailer) else {return}
        moviePlayer = AVPlayer(url: url)
        moviePlayerController = AVPlayerViewController()
        moviePlayerController?.player = moviePlayer
        moviePlayerController?.showsPlaybackControls = true
        
        //Para mostrar sem ser trela cheia
        moviePlayerController?.view.frame = viewMovieContainer.bounds
        viewMovieContainer.addSubview(moviePlayerController!.view)
    }
    
    private func playMovie() {
        //Mostrando na view
        viewMovieContainer.isHidden = false
        self.moviePlayer?.play()
        
        /*
         //Mostrando em tela cheia!
        guard let moviePlayerController = moviePlayerController else {return}
        present(moviePlayerController, animated: true) {
            self.moviePlayer?.play()
        }
        */
    }
}

