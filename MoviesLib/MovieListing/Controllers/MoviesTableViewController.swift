//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 23/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    // MARK: - Properties
    var movies: [Movie] = []
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    // MARK: - Methods
    private func loadMovies() {
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
                do {
                    let jsonData = try Data(contentsOf: jsonURL)
                    let jsonDecoder = JSONDecoder()
        //            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        //            jsonDecoder.dateDecodingStrategy = .iso8601
                    movies = try jsonDecoder.decode([Movie].self, from: jsonData)
//                    movies.forEach({print($0.categories)})
                    
                    tableView.reloadData()
                    
                } catch {
                    print(error)
                }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }

        let movie = movies[indexPath.row]
        cell.configure(with: movie)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
