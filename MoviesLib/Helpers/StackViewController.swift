//
//  StackViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 23/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet weak var button7: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5) {
            self.button7.isHidden.toggle()
        }
    }

}
