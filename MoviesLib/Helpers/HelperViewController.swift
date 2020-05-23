//
//  HelperViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 23/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

class HelperViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    /*{
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension HelperViewController: UITableViewDelegate {
    
}

extension HelperViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
