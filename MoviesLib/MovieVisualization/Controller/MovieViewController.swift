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
