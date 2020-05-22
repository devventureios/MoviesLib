//
//  ViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 20/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelURL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelURL.text = "https://toystory3.com"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print(labelURL.superview)
    }

}

