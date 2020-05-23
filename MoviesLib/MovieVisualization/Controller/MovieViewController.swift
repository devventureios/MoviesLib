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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    func loadMovies() {
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let jsonDecoder = JSONDecoder()
//            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//            jsonDecoder.dateDecodingStrategy = .iso8601
            let movies = try jsonDecoder.decode([Movie].self, from: jsonData)
            movies.forEach({print($0.categories)})
        } catch {
            print(error)
        }
        
        
        
    }

}


class Settings {
    
    var description = ""
    
    fileprivate func showDescription() {
        print("A descrição é: \(description)")
    }
    
    init(description: String) {
        self.description = description
    }
    
}





/*
class Settings {
    var isPremiumUser = false
    static var singleton = Settings(isPremiumUser: false)
    
    private init(isPremiumUser: Bool) {
        self.isPremiumUser = isPremiumUser
    }
}
*/
